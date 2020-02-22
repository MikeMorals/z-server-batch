data
export g_admin_cmds
align 4
LABELV g_admin_cmds
address $87
address G_admin_adjustban
address $88
address $89
address $90
address $91
address G_admin_admintest
address $91
address $92
address $93
address $94
address G_admin_denybuild
address $95
address $96
address $97
address $98
address G_admin_allready
address $98
address $99
address $93
address $100
address G_badges
address $101
address $102
address $93
address $103
address G_badges
address $101
address $104
address $93
address $105
address G_badgelist
address $101
address $106
address $93
address $107
address G_badgelist
address $101
address $106
address $93
address $88
address G_admin_ban
address $88
address $108
address $109
address $110
address G_admin_buildlog
address $110
address $111
address $112
address $113
address G_admin_bot
address $114
address $115
address $116
address $117
address G_admin_botcmd
address $118
address $119
address $120
address $121
address G_admin_cancelvote
address $121
address $122
address $93
address $123
address G_admin_cp
address $123
address $124
address $125
address $95
address G_admin_denybuild
address $95
address $126
address $97
address $127
address G_admin_designate
address $127
address $128
address $97
address $129
address G_admin_devmap
address $129
address $130
address $131
address $101
address G_admin_help
address $101
address $132
address $133
address $134
address G_admin_info
address $134
address $135
address $136
address $137
address G_admin_kick
address $137
address $138
address $139
address $140
address G_admin_L0
address $141
address $142
address $97
address $143
address G_admin_L1
address $144
address $145
address $97
address $146
address G_admin_layoutsave
address $146
address $147
address $148
address $149
address G_admin_listadmins
address $149
address $150
address $151
address $152
address G_admin_listlayouts
address $152
address $153
address $154
address $155
address G_admin_listplayers
address $155
address $156
address $93
address $157
address G_admin_listmaps
address $101
address $158
address $159
address $160
address G_admin_lock
address $160
address $161
address $162
address $163
address G_admin_map
address $163
address $164
address $131
address $165
address G_admin_maplog
address $165
address $166
address $93
address $167
address G_admin_message
address $168
address $169
address $170
address $171
address G_admin_mute
address $171
address $172
address $97
address $173
address G_admin_mystats
address $101
address $174
address $93
address $175
address G_admin_namelog
address $175
address $176
address $177
address $178
address G_admin_nextmap
address $178
address $179
address $93
address $180
address G_admin_passvote
address $180
address $181
address $93
address $182
address G_admin_pause
address $182
address $183
address $93
address $184
address G_admin_putteam
address $184
address $185
address $186
address $187
address G_admin_readconfig
address $187
address $188
address $93
address $189
address G_admin_register
address $101
address $190
address $93
address $191
address G_admin_rename
address $191
address $192
address $193
address $194
address G_admin_restart
address $194
address $195
address $196
address $197
address G_admin_revert
address $197
address $198
address $199
address $200
address G_admin_listrotation
address $101
address $201
address $93
address $202
address G_admin_setlevel
address $202
address $203
address $204
address $205
address G_admin_showbans
address $205
address $206
address $207
address $208
address G_admin_spec999
address $208
address $209
address $93
address $210
address G_admin_putmespec
address $210
address $211
address $93
address $212
address G_admin_subnetban
address $212
address $213
address $214
address $215
address G_admin_time
address $215
address $216
address $93
address $217
address G_admin_unban
address $88
address $218
address $219
address $220
address G_admin_designate
address $127
address $221
address $97
address $222
address G_admin_unlock
address $160
address $223
address $162
address $224
address G_admin_mute
address $171
address $225
address $97
address $226
address G_admin_warn
address $226
address $227
address $228
address $229
address G_drawnodes
address $226
address $230
address $231
address $232
address G_reconnectdb
address $160
address $233
address $234
address $235
address G_admin_switch
address $226
address $236
address $228
address $237
address G_admin_printgrid
address $226
address $238
address $239
address $240
address G_admin_printpath
address $226
address $238
address $239
address $241
address G_admin_findpath
address $226
address $242
address $239
address $243
address G_setnextnode
address $226
address $244
address $239
address $245
address G_set_survival_stage
address $226
address $246
address $247
address $248
address G_switchnodes
address $226
address $249
address $250
address $251
address G_adminDeleteGlobal
address $252
address $253
address $254
address $255
address G_adminListGlobals
address $252
address $256
address $93
address $257
address G_adminGlobalMute
address $252
address $258
address $259
address $260
address G_adminGlobalForcespec
address $252
address $261
address $262
address $263
address G_adminGlobalDenyBuild
address $252
address $264
address $265
address $266
address G_adminGlobalHandicap
address $252
address $267
address $268
address $269
address G_adminGlobalBan
address $252
address $270
address $271
address $272
address G_adminGlobalSync
address $252
address $273
address $274
address $275
address G_adminWhiteAdd
address $252
address $276
address $277
address $278
address G_adminWhiteList
address $252
address $279
address $93
address $280
address G_adminWhiteDelete
address $252
address $281
address $282
align 4
LABELV adminNumCmds
byte 4 75
align 4
LABELV admin_level_maxname
byte 4 0
code
proc admin_permission 44 8
file "..\..\..\..\src/game/g_admin.c"
line 272
;1:/*
;2: ===========================================================================
;3: Copyright (C) 2004-2006 Tony J. White
;4:
;5: This file is part of Tremulous.
;6:
;7: This shrubbot implementation is the original work of Tony J. White.
;8:
;9: Contains contributions from Wesley van Beelen, Chris Bajumpaa, Josh Menke,
;10: and Travis Maurer.
;11:
;12: The functionality of this code mimics the behaviour of the currently
;13: inactive project shrubet (http://www.etstats.com/shrubet/index.php?ver=2)
;14: by Ryan Mannion.   However, shrubet was a closed-source project and
;15: none of it's code has been copied, only it's functionality.
;16:
;17: Tremulous is free software; you can redistribute it
;18: and/or modify it under the terms of the GNU General Public License as
;19: published by the Free Software Foundation; either version 2 of the License,
;20: or (at your option) any later version.
;21:
;22: Tremulous is distributed in the hope that it will be
;23: useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;24: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;25: GNU General Public License for more details.
;26:
;27: You should have received a copy of the GNU General Public License
;28: along with Tremulous; if not, write to the Free Software
;29: Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;30: ===========================================================================
;31: */
;32:
;33:#include "g_local.h"
;34:#include "tremulous.h"
;35:#include "acebot.h"
;36:
;37:// big ugly global buffer for use with buffered printing of long outputs
;38:static char g_bfb[32000];
;39:
;40:// note: list ordered alphabetically
;41:g_admin_cmd_t g_admin_cmds[] =
;42:{
;43:{ "adjustban", G_admin_adjustban, "ban", "change the duration or reason of a ban.  time is specified as numbers "
;44:  "followed by units 'w' (weeks), 'd' (days), 'h' (hours) or 'm' (minutes),"
;45:  " or seconds if no units are specified. if the duration is"
;46:  " preceded by a + or -, the ban duration will be extended or shortened by"
;47:  " the specified amount", "[^3ban#^7] (^5duration^7) (^5reason^7)" },
;48:
;49:{ "admintest", G_admin_admintest, "admintest", "display your current admin level", "" },
;50:	
;51:{ "allowbuild", G_admin_denybuild, "denybuild", "restore a player's ability to build", "[^3name|slot#^7]" },
;52:
;53:{ "allready", G_admin_allready, "allready", "makes everyone ready in intermission", "" },
;54:
;55:	{"badges", G_badges, "help",
;56:		"Badges",
;57:		""
;58:	},
;59:	{"badge", G_badges, "help",
;60:		"An alias for !badges",
;61:		""
;62:	},
;63:	{"badgelist", G_badgelist, "help",
;64:		"List Badges",
;65:		""
;66:	},
;67:	{"listbadges", G_badgelist, "help",
;68:		"List Badges",
;69:		""
;70:	},
;71:	
;72:{ "ban", G_admin_ban, "ban", "ban a player by IP and GUID with an optional expiration time and reason."
;73:  "  time is specified as numbers followed by units 'w' (weeks), 'd' "
;74:  "(days), 'h' (hours) or 'm' (minutes), or seconds if no units are "
;75:  "specified", "[^3name|slot#|IP^7] (^5time^7) (^5reason^7)" },
;76:
;77:{ "buildlog", G_admin_buildlog, "buildlog", "display a list of recent builds and deconstructs, optionally specifying"
;78:  " a team", "(^5xnum^7) (^5#skip^7) (^5-name|num^7) (^5a|h^7)"
;79:  "\n ^3Example:^7 '!buildlog #10 h' skips 10 events, then shows the previous 10 events affecting human buildables" },
;80:
;81:{ "bot", G_admin_bot, "Z", "Add or delete bot(s)", "[^3add/del^7] [name] [^5aliens/humans^7] (skill)" },
;82:
;83:{ "botcmd", G_admin_botcmd, "z", "Change bot behavior.",
;84:    "[^3name^7] [^5regular/idle/attack/standground/defensive/followprotect/followattack/followidle/teamkill^7]" },
;85:
;86:{ "cancelvote", G_admin_cancelvote, "cancelvote", "cancel a vote taking place", "" },
;87:
;88:{ "cp", G_admin_cp, "cp", "display a CP message to users, optionally specifying team(s) to send to", "(-AHS) [^3message^7]" },
;89:
;90:{ "denybuild", G_admin_denybuild, "denybuild", "take away a player's ability to build", "[^3name|slot#^7]" },
;91:
;92:{ "designate", G_admin_designate, "designate", "give the player designated builder privileges", "[^3name|slot#^7]" },
;93:
;94:{ "devmap", G_admin_devmap, "devmap", "load a map with cheats (and optionally force layout)", "[^3mapname^7] (^5layout^7)" },
;95:
;96:{ "help", G_admin_help, "help", "display commands available to you or help on a specific command", "(^5command^7)" },
;97:
;98:{ "info", G_admin_info, "info", "display the contents of server info files", "(^5subject^7)" },
;99:
;100:{ "kick", G_admin_kick, "kick", "kick a player with an optional reason", "[^3name|slot#^7] (^5reason^7)" },
;101:
;102:{ "L0", G_admin_L0, "l0", "Sets a level 1 to level 0", "[^3name|slot#^7]" },
;103:
;104:{ "L1", G_admin_L1, "l1", "Sets a level 0 to level 1", "[^3name|slot#^7]" },
;105:
;106:{ "layoutsave", G_admin_layoutsave, "layoutsave", "save a map layout", "[^3mapname^7]" },
;107:
;108:{ "listadmins", G_admin_listadmins, "listadmins", "display a list of all server admins and their levels",
;109:    "(^5name|start admin#^7) (^5minimum level to display^7)" },
;110:
;111:{ "listlayouts", G_admin_listlayouts, "listlayouts", "display a list of all available layouts for a map", "(^5mapname^7)" },
;112:
;113:{ "listplayers", G_admin_listplayers, "listplayers", "display a list of players, their client numbers and their levels", "" },
;114:
;115:{ "listmaps", G_admin_listmaps, "help", "display a list of available maps on the server", "(^5map name^7)" },
;116:
;117:{ "lock", G_admin_lock, "lock", "lock a team to prevent anyone from joining it", "[^3a|h^7]" },
;118:
;119:{ "map", G_admin_map, "map", "load a map (and optionally force layout)", "[^3mapname^7] (^5layout^7)" },
;120:
;121:{ "maplog", G_admin_maplog, "maplog", "show recently played maps", "" },
;122:
;123:{"message", G_admin_message, "s", "DO NOT USE! Changes entrance message.","[message]"},
;124:	
;125:{ "mute", G_admin_mute, "mute", "mute a player", "[^3name|slot#^7]" },
;126:
;127:{ "mystats", G_admin_mystats, "help", "show your player stats", "" },
;128:	
;129:{ "namelog", G_admin_namelog, "namelog", "display a list of names used by recently connected players", "(^5name^7)" },
;130:
;131:{ "nextmap", G_admin_nextmap, "nextmap", "go to the next map in the cycle", "" },
;132:
;133:{ "passvote", G_admin_passvote, "passvote", "pass a vote currently taking place", "" },
;134:
;135:{ "pause", G_admin_pause, "pause", "Pause (or unpause) the game.", "" },
;136:
;137:{ "putteam", G_admin_putteam, "putteam", "move a player to a specified team", "[^3name|slot#^7] [^3h|a|s^7]" },
;138:
;139:{ "readconfig", G_admin_readconfig, "readconfig", "reloads the admin config file and refreshes permission flags", "" },
;140:
;141:{ "register", G_admin_register, "help", "Registers your name to protect it from being used by others or updates your admin name to your current name.", "" },
;142:
;143:{ "rename", G_admin_rename, "rename", "rename a player", "[^3name|slot#^7] [^3new name^7]" },
;144:
;145:{ "restart", G_admin_restart, "restart", "restart the current map (optionally using named layout or keeping/switching teams)",
;146:    "(^5layout^7) (^5keepteams|switchteams|keepteamslock|switchteamslock^7)" },
;147:
;148:{ "revert", G_admin_revert, "revert", "revert one or more buildlog events, optionally of only one team", "(^5xnum^7) (^5#ID^7) (^5-name|num^7) (^5a|h^7)"
;149:  "\n ^3Example:^7 '!revert x5 h' reverts the last 5 events affecting human buildables" },
;150:
;151:{ "rotation", G_admin_listrotation, "help", "display a list of maps that are in the active map rotation", "" },
;152:
;153:{ "setlevel", G_admin_setlevel, "setlevel", "sets the admin level of a player", "[^3name|slot#|admin#^7] [^3level^7]" },
;154:
;155:{ "showbans", G_admin_showbans, "showbans", "display a (partial) list of active bans", "(^5start at ban#^7) (^5name|IP|'-subnet'^7)" },
;156:
;157:{ "spec999", G_admin_spec999, "spec999", "move 999 pingers to the spectator team", "" },
;158:
;159://kev: a bit of a hack, but there is no real point to
;160:    //creating a new admin flag for this, so i stole it from !help
;161:    { "specme", G_admin_putmespec, "specme", "moves you to the spectators", "" },
;162:
;163:    { "subnetban", G_admin_subnetban, "subnetban", "Add or change a subnet mask on a ban", "[^3ban#^7] [^5CIDR mask^7]"
;164:      "\n ^3Example:^7 '!subnetban 10 16' changes ban #10 to be a ban on XXX.XXX.*.*"
;165:      "\n ^3Example:^7 '!subnetban 10 24' changes ban #10 to be a ban on XXX.XXX.XXX.*"
;166:      "\n ^3Example:^7 '!subnetban 10 32' changes ban #10 to be a regular (non-subnet) ban"
;167:      "\n ^1WARNING:^7 Use of this command may make your admin.dat incompatible with other game.qvms" },
;168:
;169:    { "time", G_admin_time, "time", "show the current local server time", "" },
;170:
;171:    { "unban", G_admin_unban, "ban", "unbans a player specified by the slot as seen in showbans", "[^3ban#^7]" },
;172:
;173:    { "undesignate", G_admin_designate, "designate", "revoke designated builder privileges", "[^3name|slot#^7]" },
;174:
;175:    { "unlock", G_admin_unlock, "lock", "unlock a locked team", "[^3a|h^7]" },
;176:
;177:    { "unmute", G_admin_mute, "mute", "unmute a muted player", "[^3name|slot#^7]" },
;178:
;179:    { "warn", G_admin_warn, "warn", "Warn a player to cease or face admin intervention", "[^3name|slot#^7] [reason]" },
;180:    { "drawnodes", G_drawnodes, "warn", "Draw Grid Nodes", "Do not require params" },
;181:    { "reconnectdb", G_reconnectdb, "lock", "reconnect to the database", "do it!" },
;182:    { "switch", G_admin_switch, "warn", "Switch your own team", "[^3name|slot#^7] [reason]" },
;183:    { "printgrid", G_admin_printgrid, "warn", "Print the node grid", "Dont fucking use it" },
;184:    { "printpath", G_admin_printpath, "warn", "Print the node grid", "Dont fucking use it" },
;185:    { "findpath", G_admin_findpath, "warn", "Find a path from where im to a node", "Dont fucking use it" },
;186:    { "setnextnode", G_setnextnode, "warn", "find the next node and set it to player", "Dont fucking use it" },
;187:    { "survivalstage", G_set_survival_stage, "warn", "Set & show survival stage", "#Only use it when making layouts" },
;188:    { "switchnodes", G_switchnodes, "warn", "Show and hide alien nodes", "Just dont use this shit" },
;189:    {"gdelete", G_adminDeleteGlobal, "w",
;190:            "delete a global entry",
;191:            "(^5 global id ^7)"
;192:      },
;193:      {"glist", G_adminListGlobals, "w",
;194:            "display a list of active globals",
;195:            ""
;196:      },
;197:      {"gmute", G_adminGlobalMute, "w",
;198:            "global mute",
;199:            "[^3name|#slot|ip^7] (^51^7) [^3reason^7]"
;200:            "\n ^3Example:^7 '!gmute UnnamedPlayer 1 Innapropiate language' mute UnnamedPlayer subnet"
;201:            "\n ^3Example:^7 '!gmute 127.0.0.3 1 Chat Spam' mute all ips that start with 127.0."
;202:            "\n ^3Example:^7 '!gmute 192.168.0.1 Trolling' mute ip 192.168.0.1"
;203:            "\n ^1must provide proof/demo/condump/screenshot^7 every time is used"
;204:      },
;205:      {"gforcespec", G_adminGlobalForcespec, "w",
;206:            "global forcespec, forcespec player will not able to join teams",
;207:            "[^3name|#slot|ip^7] (^51^7)  [^3reason^7]"
;208:            "\n ^3Example:^7 '!gforcespec UnnamedPlayer 1 Griefing' forcespec UnnamedPlayer subnet"
;209:            "\n ^3Example:^7 '!gforcespec 127.0.0.1 1 Griefing' forcespec ips that start with 127.0."
;210:            "\n ^3Example:^7 '!gforcespec 192.168.0.1 Griefing' forcespec the ip 192.168.0.1"
;211:            "\n ^1must provide demo^7 every time is used"
;212:      },
;213:      {"gdenybuild", G_adminGlobalDenyBuild, "w",
;214:            "global denybuild, player will not able to build",
;215:            "[^3name|#slot|ip^7] (^51^7)  [^3reason^7]"
;216:            "\n ^3Example:^7 '!gdenybuild UnnamedPlayer 1 Decon and disconnect' denybuild UnnamedPlayer subnet"
;217:            "\n ^3Example:^7 '!gdenybuild 127.0.0.1 1 Decon and disconnect' denybuild ips that start with 127.0."
;218:            "\n ^3Example:^7 '!gdenybuild 192.168.0.1 Decon and disconnect' denybuild the ip 192.168.0.1"
;219:            "\n ^1must provide proof/demo^7 every time is used, /builder command can help"
;220:      },
;221:      //High chance of this command begin abused.
;222:      {"ghandicap", G_adminGlobalHandicap, "w",
;223:            "global handicap, handi cap players using aimbot/wallhack",
;224:            "[^3name|#slot|ip^7] (^51^7)  [^3reason^7]"
;225:            "\n ^3Example:^7 '!ghandicap UnnamedPlayer 1 Aimboting and wallhacking' handycap UnnamedPlayer subnet"
;226:            "\n ^3Example:^7 '!ghandicap 127.0.0.1 1 Aimboting and wallhacking' handycap ips that start with 127.0."
;227:            "\n ^3Example:^7 '!ghandicap 192.168.0.1 Aimboting and wallhacking' handycap ip 192.168.0.1"
;228:            "\n ^1must provide demo^7 every time is used"
;229:      },
;230:      {"gban", G_adminGlobalBan, "w",
;231:            "global ban, only use it on extreme cases",
;232:            "[^3name|#slot|ip^7] (^51^7)  [^3reason^7]"
;233:            "\n ^3Example:^7 '!gban UnnamedPlayer 1 Ban evasion' ban UnnamedPlayer subnet"
;234:            "\n ^3Example:^7 '!gban 127.0.0.1 1 Ban evasion' ban ips that start with 127.0. aka subnet"
;235:            "\n ^3Example:^7 '!gban 192.168.0.1 Ban evasion' ban ip 192.168.0.1"
;236:            "\n ^1must report^7 every time is used"
;237:      },
;238:      {"gsync", G_adminGlobalSync, "w",
;239:            "re-fetch global list from database, all the changes maded on the current game will be lost",
;240:            "[^51^7]"
;241:            "\n ^3Example:^7 '!gsync 1' will re-fetch global list from database"
;242:      },
;243:      {"wadd", G_adminWhiteAdd, "w",
;244:              "whitelist a ip/guid on global system",
;245:              "[^3guid|ip^7] [^3#slot|ip^7] [^3reason^7]"
;246:      },
;247:      {"wlist", G_adminWhiteList, "w",
;248:                 "List the whitelisted ips/guids",
;249:                 ""
;250:      },
;251:      {"wdelete", G_adminWhiteDelete, "w",
;252:                 "Delete a white listed entry",
;253:                 "(^5 white id ^7)"
;254:      },
;255:};
;256:
;257:static int adminNumCmds = sizeof(g_admin_cmds) / sizeof(g_admin_cmds[0]);
;258:
;259:static int admin_level_maxname = 0;
;260:g_admin_level_t *g_admin_levels[MAX_ADMIN_LEVELS];
;261:g_admin_admin_t *g_admin_admins[MAX_ADMIN_ADMINS];
;262:g_admin_ban_t *g_admin_bans[MAX_ADMIN_BANS];
;263:g_admin_command_t *g_admin_commands[MAX_ADMIN_COMMANDS];
;264:g_admin_namelog_t *g_admin_namelog[MAX_ADMIN_NAMELOGS];
;265:
;266:// match a certain flag within these flags
;267:// return state of whether flag was found or not, 
;268:// set *perm to indicate whether found flag was + or -
;269:
;270:static qboolean
;271:admin_permission(char *flags, const char *flag, qboolean *perm)
;272:{
line 273
;273:  char *token, *token_p = flags;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $285
JUMPV
LABELV $284
line 275
;274:  while(*(token = COM_Parse(&token_p)))
;275:  {
line 276
;276:    *perm = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 1
ASGNI4
line 277
;277:    if (*token == '-' || *token == '+')
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 45
EQI4 $289
ADDRLP4 8
INDIRI4
CNSTI4 43
NEI4 $287
LABELV $289
line 278
;278:      *perm = *token++ == '+';
ADDRLP4 16
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 43
NEI4 $291
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $292
JUMPV
LABELV $291
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $292
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
LABELV $287
line 279
;279:    if (!strcmp(token, flag))
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $293
line 280
;280:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $283
JUMPV
LABELV $293
line 281
;281:    if (!strcmp(token, ADMF_ALLFLAGS))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $297
ARGP4
ADDRLP4 24
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $295
line 282
;282:    {
ADDRGP4 $299
JUMPV
LABELV $298
line 284
;283:      while(*(token = COM_Parse(&token_p)))
;284:      {
line 286
;285:        // -ALLFLAGS +flag or ALLFLAGS -flag
;286:        if (*token != (*perm ? '-' : '+'))
ADDRFP4 8
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $304
ADDRLP4 28
CNSTI4 45
ASGNI4
ADDRGP4 $305
JUMPV
LABELV $304
ADDRLP4 28
CNSTI4 43
ASGNI4
LABELV $305
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 28
INDIRI4
EQI4 $301
line 287
;287:          continue;
ADDRGP4 $299
JUMPV
LABELV $301
line 288
;288:        if (!strcmp(token + 1, flag))
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $306
line 289
;289:        {
line 290
;290:          *perm = !*perm;
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $309
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRGP4 $310
JUMPV
LABELV $309
ADDRLP4 36
CNSTI4 0
ASGNI4
LABELV $310
ADDRLP4 40
INDIRP4
ADDRLP4 36
INDIRI4
ASGNI4
line 291
;291:          break;
ADDRGP4 $300
JUMPV
LABELV $306
line 293
;292:        }
;293:      }
LABELV $299
line 283
ADDRLP4 4
ARGP4
ADDRLP4 28
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $298
LABELV $300
line 294
;294:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $283
JUMPV
LABELV $295
line 296
;295:    }
;296:  }
LABELV $285
line 274
ADDRLP4 4
ARGP4
ADDRLP4 8
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $284
line 297
;297:  return qfalse;
CNSTI4 0
RETI4
LABELV $283
endproc admin_permission 44 8
export G_admin_permission_guid
proc G_admin_permission_guid 28 12
line 305
;298:}
;299:
;300:// This function should only be used directly when the client is connecting and thus has no GUID.
;301:// Else, use G_admin_permission()
;302:
;303:qboolean
;304:G_admin_permission_guid(char *guid, const char* flag)
;305:{
line 307
;306:  int i;
;307:  int l = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 308
;308:  qboolean perm = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 312
;309:
;310:  // Does the admin specifically have this flag granted/denied to them,
;311:  // irrespective of their admin level?
;312:  for(i = 0;i < MAX_ADMIN_ADMINS && g_admin_admins[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $315
JUMPV
LABELV $312
line 313
;313:  {
line 314
;314:    if (!Q_stricmp(guid, g_admin_admins[i]->guid))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
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
NEI4 $316
line 315
;315:    {
line 316
;316:      if (admin_permission(g_admin_admins[i]->flags, flag, &perm))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 72
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 16
ADDRGP4 admin_permission
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $318
line 317
;317:        return perm;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $311
JUMPV
LABELV $318
line 318
;318:      l = g_admin_admins[i]->level;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 319
;319:      break;
ADDRGP4 $314
JUMPV
LABELV $316
line 321
;320:    }
;321:  }
LABELV $313
line 312
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $315
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $320
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $312
LABELV $320
LABELV $314
line 324
;322:
;323:  // If not, is this flag granted/denied for their admin level?
;324:  for(i = 0;i < MAX_ADMIN_LEVELS && g_admin_levels[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $324
JUMPV
LABELV $321
line 325
;325:  {
line 326
;326:    if (g_admin_levels[i]->level == l)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $325
line 327
;327:      return admin_permission(g_admin_levels[i]->flags, flag, &perm) && perm;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 20
ADDRGP4 admin_permission
CALLI4
ASGNI4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $328
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $328
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $329
JUMPV
LABELV $328
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $329
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $311
JUMPV
LABELV $325
line 328
;328:  }
LABELV $322
line 324
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $324
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $330
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $321
LABELV $330
line 329
;329:  return qfalse;
CNSTI4 0
RETI4
LABELV $311
endproc G_admin_permission_guid 28 12
export G_admin_permission
proc G_admin_permission 4 8
line 334
;330:}
;331:
;332:qboolean
;333:G_admin_permission(gentity_t *ent, const char *flag)
;334:{
line 335
;335:  if (!ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $332
line 336
;336:    return qtrue; //console always wins
CNSTI4 1
RETI4
ADDRGP4 $331
JUMPV
LABELV $332
line 338
;337:
;338:  return G_admin_permission_guid(ent->client->pers.guid, flag);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 G_admin_permission_guid
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $331
endproc G_admin_permission 4 8
lit
align 1
LABELV $335
byte 1 0
skip 31
align 1
LABELV $336
byte 1 0
skip 31
export G_admin_name_check
code
proc G_admin_name_check 100 12
line 343
;339:}
;340:
;341:qboolean
;342:G_admin_name_check(gentity_t *ent, char *name, char *err, int len)
;343:{
line 347
;344:  int i;
;345:  gclient_t *client;
;346:  char testName[MAX_NAME_LENGTH] =
;347:  { "" };
ADDRLP4 36
ADDRGP4 $335
INDIRB
ASGNB 32
line 349
;348:  char name2[MAX_NAME_LENGTH] =
;349:  { "" };
ADDRLP4 4
ADDRGP4 $336
INDIRB
ASGNB 32
line 350
;350:  int alphaCount = 0;
ADDRLP4 72
CNSTI4 0
ASGNI4
line 352
;351:
;352:  G_SanitiseString(name, name2, sizeof(name2));
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 354
;353:
;354:  if (!Q_stricmp(name2, "UnnamedPlayer"))
ADDRLP4 4
ARGP4
ADDRGP4 $339
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $337
line 355
;355:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $334
JUMPV
LABELV $337
line 357
;356:
;357:  if (!Q_stricmp(name2, "console"))
ADDRLP4 4
ARGP4
ADDRGP4 $342
ARGP4
ADDRLP4 80
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
NEI4 $340
line 358
;358:  {
line 359
;359:    Q_strncpyz(err, va("The name '%s^7' is invalid here", name2), len);
ADDRGP4 $343
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 360
;360:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $334
JUMPV
LABELV $340
line 363
;361:  }
;362:
;363:  for(i = 0;i < level.maxclients;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $347
JUMPV
LABELV $344
line 364
;364:  {
line 365
;365:    client = &level.clients[i];
ADDRLP4 68
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 366
;366:    if (client->pers.connected != CON_CONNECTING && client->pers.connected != CON_CONNECTED)
ADDRLP4 84
ADDRLP4 68
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 1
EQI4 $349
ADDRLP4 84
INDIRI4
CNSTI4 2
EQI4 $349
line 367
;367:    {
line 368
;368:      continue;
ADDRGP4 $345
JUMPV
LABELV $349
line 372
;369:    }
;370:
;371:    // can rename ones self to the same name using different colors
;372:    if (i == (ent - g_entities))
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
NEI4 $351
line 373
;373:      continue;
ADDRGP4 $345
JUMPV
LABELV $351
line 375
;374:
;375:    G_SanitiseString(client->pers.netname, testName, sizeof(testName));
ADDRLP4 68
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 376
;376:    if (!Q_stricmp(name2, testName))
ADDRLP4 4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $353
line 377
;377:    {
line 378
;378:      Q_strncpyz(err, va("The name '%s^7' is already in use", name), len);
ADDRGP4 $355
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 379
;379:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $334
JUMPV
LABELV $353
line 381
;380:    }
;381:  }
LABELV $345
line 363
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $347
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $344
line 383
;382:
;383:  if (Q_isdigit(name2[0]) || name2[0] == '-')
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 84
ADDRGP4 Q_isdigit
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $358
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $356
LABELV $358
line 384
;384:  {
line 385
;385:    Q_strncpyz(err, "Names cannot begin with a number or with a dash. Please choose another.", len);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $359
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 386
;386:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $334
JUMPV
LABELV $356
line 389
;387:  }
;388:
;389:  for(i = 0;name2[i] != '\0';i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $363
JUMPV
LABELV $360
line 390
;390:  {
line 391
;391:    if (Q_isalpha(name2[i]))
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 88
ADDRGP4 Q_isalpha
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $364
line 392
;392:      alphaCount++;
ADDRLP4 72
ADDRLP4 72
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $364
line 394
;393:
;394:    if (name2[i] == ' ')
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $366
line 395
;395:    {
line 396
;396:      if (name2[i + 1] == '-')
ADDRLP4 0
INDIRI4
ADDRLP4 4+1
ADDP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $368
line 397
;397:      {
line 398
;398:        Q_strncpyz(err, "Names cannot contain a - preceded by a space. Please choose another.", len);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $371
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 399
;399:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $334
JUMPV
LABELV $368
line 401
;400:      }
;401:    }
LABELV $366
line 402
;402:  }
LABELV $361
line 389
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $363
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $360
line 404
;403:
;404:  if (alphaCount == 0)
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $372
line 405
;405:  {
line 406
;406:    Q_strncpyz(err, va("The name '%s^7' does not include at least one letter. Please choose another.", name), len);
ADDRGP4 $374
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 407
;407:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $334
JUMPV
LABELV $372
line 410
;408:  }
;409:
;410:  if (!g_adminNameProtect.string[0])
ADDRGP4 g_adminNameProtect+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $375
line 411
;411:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $334
JUMPV
LABELV $375
line 413
;412:
;413:  for(i = 0;i < MAX_ADMIN_ADMINS && g_admin_admins[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $381
JUMPV
LABELV $378
line 414
;414:  {
line 415
;415:    if (g_admin_admins[i]->level < 1)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
GEI4 $382
line 416
;416:      continue;
ADDRGP4 $379
JUMPV
LABELV $382
line 417
;417:    G_SanitiseString(g_admin_admins[i]->name, testName, sizeof(testName));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 33
ADDP4
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 418
;418:    if (!Q_stricmp(name2, testName) && Q_stricmp(ent->client->pers.guid, g_admin_admins[i]->guid))
ADDRLP4 4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $384
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $384
line 419
;419:    {
line 420
;420:      Q_strncpyz(err, va("The name '%s^7' belongs to an admin. "
ADDRGP4 $386
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 422
;421:        "Please choose another.", name), len);
;422:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $334
JUMPV
LABELV $384
line 424
;423:    }
;424:  }
LABELV $379
line 413
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $381
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $387
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $378
LABELV $387
line 425
;425:  return qtrue;
CNSTI4 1
RETI4
LABELV $334
endproc G_admin_name_check 100 12
proc admin_higher_guid 24 8
line 430
;426:}
;427:
;428:static qboolean
;429:admin_higher_guid(char *admin_guid, char *victim_guid)
;430:{
line 432
;431:  int i;
;432:  int alevel = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 434
;433:
;434:  for(i = 0;i < MAX_ADMIN_ADMINS && g_admin_admins[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $392
JUMPV
LABELV $389
line 435
;435:  {
line 436
;436:    if (!Q_stricmp(admin_guid, g_admin_admins[i]->guid))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $393
line 437
;437:    {
line 438
;438:      alevel = g_admin_admins[i]->level;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 439
;439:      break;
ADDRGP4 $391
JUMPV
LABELV $393
line 441
;440:    }
;441:  }
LABELV $390
line 434
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $392
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $395
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $389
LABELV $395
LABELV $391
line 442
;442:  for(i = 0;i < MAX_ADMIN_ADMINS && g_admin_admins[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $399
JUMPV
LABELV $396
line 443
;443:  {
line 444
;444:    if (!Q_stricmp(victim_guid, g_admin_admins[i]->guid))
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
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
NEI4 $400
line 445
;445:    {
line 446
;446:      if (alevel < g_admin_admins[i]->level)
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
GEI4 $402
line 447
;447:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $388
JUMPV
LABELV $402
line 448
;448:      if (strstr(g_admin_admins[i]->flags, va("%s", ADMF_IMMUTABLE)))
ADDRGP4 $406
ARGP4
ADDRGP4 $407
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 72
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $404
line 449
;449:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $388
JUMPV
LABELV $404
line 450
;450:    }
LABELV $400
line 451
;451:  }
LABELV $397
line 442
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $399
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $408
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $396
LABELV $408
line 452
;452:  return qtrue;
CNSTI4 1
RETI4
LABELV $388
endproc admin_higher_guid 24 8
proc admin_higher 12 8
line 457
;453:}
;454:
;455:static qboolean
;456:admin_higher(gentity_t *admin, gentity_t *victim)
;457:{
line 460
;458:
;459:  // console always wins
;460:  if (!admin)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $410
line 461
;461:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $409
JUMPV
LABELV $410
line 463
;462:  // just in case
;463:  if (!victim)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $412
line 464
;464:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $409
JUMPV
LABELV $412
line 466
;465:
;466:  return admin_higher_guid(admin->client->pers.guid, victim->client->pers.guid);
ADDRLP4 0
CNSTI4 516
ASGNI4
ADDRLP4 4
CNSTI4 696
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 admin_higher_guid
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $409
endproc admin_higher 12 8
proc admin_writeconfig_string 1028 12
line 471
;467:}
;468:
;469:static void
;470:admin_writeconfig_string(char *s, fileHandle_t f)
;471:{
line 474
;472:  char buf[MAX_STRING_CHARS];
;473:
;474:  buf[0] = '\0';
ADDRLP4 0
CNSTI1 0
ASGNI1
line 475
;475:  if (s[0])
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $415
line 476
;476:  {
line 478
;477:    //Q_strcat(buf, sizeof(buf), s);
;478:    Q_strncpyz(buf, s, sizeof(buf));
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 479
;479:    trap_FS_Write(buf, strlen(buf), f);
ADDRLP4 0
ARGP4
ADDRLP4 1024
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 480
;480:  }
LABELV $415
line 481
;481:  trap_FS_Write("\n", 1, f);
ADDRGP4 $417
ARGP4
CNSTI4 1
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 482
;482:}
LABELV $414
endproc admin_writeconfig_string 1028 12
proc admin_writeconfig_int 36 16
line 486
;483:
;484:static void
;485:admin_writeconfig_int(int v, fileHandle_t f)
;486:{
line 489
;487:  char buf[32];
;488:
;489:  Com_sprintf(buf, sizeof(buf), "%d", v);
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $419
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 490
;490:  if (buf[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $420
line 491
;491:    trap_FS_Write(buf, strlen(buf), f);
ADDRLP4 0
ARGP4
ADDRLP4 32
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
LABELV $420
line 492
;492:  trap_FS_Write("\n", 1, f);
ADDRGP4 $417
ARGP4
CNSTI4 1
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 493
;493:}
LABELV $418
endproc admin_writeconfig_int 36 16
lit
align 1
LABELV $423
byte 1 0
skip 1023
code
proc admin_writeconfig 1064 12
line 497
;494:
;495:static void
;496:admin_writeconfig(void)
;497:{
line 502
;498:  fileHandle_t f;
;499:  int len, i;
;500:  int t;
;501:  char levels[MAX_STRING_CHARS] =
;502:  { "" };
ADDRLP4 12
ADDRGP4 $423
INDIRB
ASGNB 1024
line 504
;503:
;504:  if (!g_admin.string[0])
ADDRGP4 g_admin+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $424
line 505
;505:  {
line 506
;506:    G_Printf(S_COLOR_YELLOW "WARNING: g_admin is not set. "
ADDRGP4 $427
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 508
;507:    " configuration will not be saved to a file.\n");
;508:    return;
ADDRGP4 $422
JUMPV
LABELV $424
line 510
;509:  }
;510:  t = trap_RealTime(NULL);
CNSTP4 0
ARGP4
ADDRLP4 1040
ADDRGP4 trap_RealTime
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1040
INDIRI4
ASGNI4
line 511
;511:  len = trap_FS_FOpenFile(g_admin.string, &f, FS_WRITE);
ADDRGP4 g_admin+16
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1044
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1044
INDIRI4
ASGNI4
line 512
;512:  if (len < 0)
ADDRLP4 1036
INDIRI4
CNSTI4 0
GEI4 $429
line 513
;513:  {
line 514
;514:    G_Printf("admin_writeconfig: could not open g_admin file \"%s\"\n", g_admin.string);
ADDRGP4 $431
ARGP4
ADDRGP4 g_admin+16
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 515
;515:    return;
ADDRGP4 $422
JUMPV
LABELV $429
line 517
;516:  }
;517:  for(i = 0;i < MAX_ADMIN_LEVELS && g_admin_levels[i];i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $436
JUMPV
LABELV $433
line 518
;518:  {
line 519
;519:    trap_FS_Write("[level]\n", 8, f);
ADDRGP4 $437
ARGP4
CNSTI4 8
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 520
;520:    trap_FS_Write("level   = ", 10, f);
ADDRGP4 $438
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 521
;521:    admin_writeconfig_int(g_admin_levels[i]->level, f);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 admin_writeconfig_int
CALLV
pop
line 522
;522:    trap_FS_Write("name    = ", 10, f);
ADDRGP4 $439
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 523
;523:    admin_writeconfig_string(g_admin_levels[i]->name, f);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 admin_writeconfig_string
CALLV
pop
line 524
;524:    trap_FS_Write("flags   = ", 10, f);
ADDRGP4 $440
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 525
;525:    admin_writeconfig_string(g_admin_levels[i]->flags, f);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 admin_writeconfig_string
CALLV
pop
line 526
;526:    trap_FS_Write("\n", 1, f);
ADDRGP4 $417
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 527
;527:  }
LABELV $434
line 517
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $436
ADDRLP4 4
INDIRI4
CNSTI4 32
GEI4 $441
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $433
LABELV $441
line 528
;528:  for(i = 0;i < MAX_ADMIN_ADMINS && g_admin_admins[i];i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $445
JUMPV
LABELV $442
line 529
;529:  {
line 531
;530:    // don't write level 0 users
;531:    if (g_admin_admins[i]->level < 1)
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
GEI4 $446
line 532
;532:      continue;
ADDRGP4 $443
JUMPV
LABELV $446
line 534
;533:
;534:    trap_FS_Write("[admin]\n", 8, f);
ADDRGP4 $448
ARGP4
CNSTI4 8
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 535
;535:    trap_FS_Write("name    = ", 10, f);
ADDRGP4 $439
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 536
;536:    admin_writeconfig_string(g_admin_admins[i]->name, f);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 33
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 admin_writeconfig_string
CALLV
pop
line 537
;537:    trap_FS_Write("guid    = ", 10, f);
ADDRGP4 $449
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 538
;538:    admin_writeconfig_string(g_admin_admins[i]->guid, f);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 admin_writeconfig_string
CALLV
pop
line 539
;539:    trap_FS_Write("level   = ", 10, f);
ADDRGP4 $438
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 540
;540:    admin_writeconfig_int(g_admin_admins[i]->level, f);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 admin_writeconfig_int
CALLV
pop
line 541
;541:    trap_FS_Write("flags   = ", 10, f);
ADDRGP4 $440
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 542
;542:    admin_writeconfig_string(g_admin_admins[i]->flags, f);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 72
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 admin_writeconfig_string
CALLV
pop
line 543
;543:    trap_FS_Write("\n", 1, f);
ADDRGP4 $417
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 544
;544:  }
LABELV $443
line 528
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $445
ADDRLP4 4
INDIRI4
CNSTI4 1024
GEI4 $450
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $442
LABELV $450
line 545
;545:  for(i = 0;i < MAX_ADMIN_BANS && g_admin_bans[i];i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $454
JUMPV
LABELV $451
line 546
;546:  {
line 549
;547:    // don't write expired bans
;548:    // if expires is 0, then it's a perm ban
;549:    if (g_admin_bans[i]->expires != 0 && (g_admin_bans[i]->expires - t) < 1)
ADDRLP4 1056
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $455
ADDRLP4 1056
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
CNSTI4 1
GEI4 $455
line 550
;550:      continue;
ADDRGP4 $452
JUMPV
LABELV $455
line 552
;551:
;552:    trap_FS_Write("[ban]\n", 6, f);
ADDRGP4 $457
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 553
;553:    trap_FS_Write("name    = ", 10, f);
ADDRGP4 $439
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 554
;554:    admin_writeconfig_string(g_admin_bans[i]->name, f);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 admin_writeconfig_string
CALLV
pop
line 555
;555:    trap_FS_Write("guid    = ", 10, f);
ADDRGP4 $449
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 556
;556:    admin_writeconfig_string(g_admin_bans[i]->guid, f);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 admin_writeconfig_string
CALLV
pop
line 557
;557:    trap_FS_Write("ip      = ", 10, f);
ADDRGP4 $458
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 558
;558:    admin_writeconfig_string(g_admin_bans[i]->ip, f);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 admin_writeconfig_string
CALLV
pop
line 559
;559:    trap_FS_Write("reason  = ", 10, f);
ADDRGP4 $459
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 560
;560:    admin_writeconfig_string(g_admin_bans[i]->reason, f);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 85
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 admin_writeconfig_string
CALLV
pop
line 561
;561:    trap_FS_Write("made    = ", 10, f);
ADDRGP4 $460
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 562
;562:    admin_writeconfig_string(g_admin_bans[i]->made, f);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 135
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 admin_writeconfig_string
CALLV
pop
line 563
;563:    trap_FS_Write("expires = ", 10, f);
ADDRGP4 $461
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 564
;564:    admin_writeconfig_int(g_admin_bans[i]->expires, f);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 admin_writeconfig_int
CALLV
pop
line 565
;565:    trap_FS_Write("banner  = ", 10, f);
ADDRGP4 $462
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 566
;566:    admin_writeconfig_string(g_admin_bans[i]->banner, f);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 admin_writeconfig_string
CALLV
pop
line 567
;567:    trap_FS_Write("\n", 1, f);
ADDRGP4 $417
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 568
;568:  }
LABELV $452
line 545
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $454
ADDRLP4 4
INDIRI4
CNSTI4 1024
GEI4 $463
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $451
LABELV $463
line 569
;569:  for(i = 0;i < MAX_ADMIN_COMMANDS && g_admin_commands[i];i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $467
JUMPV
LABELV $464
line 570
;570:  {
line 571
;571:    levels[0] = '\0';
ADDRLP4 12
CNSTI1 0
ASGNI1
line 572
;572:    trap_FS_Write("[command]\n", 10, f);
ADDRGP4 $468
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 573
;573:    trap_FS_Write("command = ", 10, f);
ADDRGP4 $469
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 574
;574:    admin_writeconfig_string(g_admin_commands[i]->command, f);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 admin_writeconfig_string
CALLV
pop
line 575
;575:    trap_FS_Write("exec    = ", 10, f);
ADDRGP4 $470
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 576
;576:    admin_writeconfig_string(g_admin_commands[i]->exec, f);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 admin_writeconfig_string
CALLV
pop
line 577
;577:    trap_FS_Write("desc    = ", 10, f);
ADDRGP4 $471
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 578
;578:    admin_writeconfig_string(g_admin_commands[i]->desc, f);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CNSTI4 84
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 admin_writeconfig_string
CALLV
pop
line 579
;579:    trap_FS_Write("flag    = ", 10, f);
ADDRGP4 $472
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 580
;580:    admin_writeconfig_string(g_admin_commands[i]->flag, f);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CNSTI4 134
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 admin_writeconfig_string
CALLV
pop
line 581
;581:    trap_FS_Write("\n", 1, f);
ADDRGP4 $417
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 582
;582:  }
LABELV $465
line 569
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $467
ADDRLP4 4
INDIRI4
CNSTI4 64
GEI4 $473
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $464
LABELV $473
line 583
;583:  trap_FS_FCloseFile(f);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 584
;584:}
LABELV $422
endproc admin_writeconfig 1064 12
proc admin_readconfig_string 28 12
line 588
;585:
;586:static void
;587:admin_readconfig_string(char **cnf, char *s, int size)
;588:{
line 592
;589:  char * t;
;590:
;591:  //COM_MatchToken(cnf, "=");
;592:  t = COM_ParseExt(cnf, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 593
;593:  if (!strcmp(t, "="))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $477
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $475
line 594
;594:  {
line 595
;595:    t = COM_ParseExt(cnf, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 596
;596:  }
ADDRGP4 $476
JUMPV
LABELV $475
line 598
;597:  else
;598:  {
line 599
;599:    G_Printf("readconfig: warning missing = before "
ADDRLP4 12
ADDRGP4 COM_GetCurrentParseLine
CALLI4
ASGNI4
ADDRGP4 $478
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 601
;600:      "\"%s\" on line %d\n", t, COM_GetCurrentParseLine());
;601:  }
LABELV $476
line 602
;602:  s[0] = '\0';
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
ADDRGP4 $480
JUMPV
LABELV $479
line 604
;603:  while(t[0])
;604:  {
line 605
;605:    if ((s[0] == '\0' && strlen(t) <= size) || (strlen(t) + strlen(s) < size))
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $485
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $484
LABELV $485
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ADDRFP4 8
INDIRI4
GEI4 $482
LABELV $484
line 606
;606:    {
line 608
;607:
;608:      Q_strcat(s, size, t);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 609
;609:      Q_strcat(s, size, " ");
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $486
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 610
;610:    }
LABELV $482
line 611
;611:    t = COM_ParseExt(cnf, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 612
;612:  }
LABELV $480
line 603
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $479
line 614
;613:  // trim the trailing space
;614:  if (strlen(s) > 0 && s[strlen(s) - 1] == ' ')
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LEI4 $487
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $487
line 615
;615:    s[strlen(s) - 1] = '\0';
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $487
line 616
;616:}
LABELV $474
endproc admin_readconfig_string 28 12
proc admin_readconfig_int 16 12
line 620
;617:
;618:static void
;619:admin_readconfig_int(char **cnf, int *v)
;620:{
line 624
;621:  char * t;
;622:
;623:  //COM_MatchToken(cnf, "=");
;624:  t = COM_ParseExt(cnf, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 625
;625:  if (!strcmp(t, "="))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $477
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $490
line 626
;626:  {
line 627
;627:    t = COM_ParseExt(cnf, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 628
;628:  }
ADDRGP4 $491
JUMPV
LABELV $490
line 630
;629:  else
;630:  {
line 631
;631:    G_Printf("readconfig: warning missing = before "
ADDRLP4 12
ADDRGP4 COM_GetCurrentParseLine
CALLI4
ASGNI4
ADDRGP4 $478
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 633
;632:      "\"%s\" on line %d\n", t, COM_GetCurrentParseLine());
;633:  }
LABELV $491
line 634
;634:  *v = atoi(t);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 635
;635:}
LABELV $489
endproc admin_readconfig_int 16 12
proc admin_default_levels 16 12
line 642
;636:
;637:// if we can't parse any levels from readconfig, set up default
;638:// ones to make new installs easier for admins
;639:
;640:static void
;641:admin_default_levels(void)
;642:{
line 646
;643:  g_admin_level_t * l;
;644:  int i;
;645:
;646:  for(i = 0;i < MAX_ADMIN_LEVELS && g_admin_levels[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $496
JUMPV
LABELV $493
line 647
;647:  {
line 648
;648:    G_Free(g_admin_levels[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Free
CALLV
pop
line 649
;649:    g_admin_levels[i] = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
CNSTP4 0
ASGNP4
line 650
;650:  }
LABELV $494
line 646
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $496
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $497
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $493
LABELV $497
line 651
;651:  for(i = 0;i <= 5;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $498
line 652
;652:  {
line 653
;653:    l = G_Alloc(sizeof(g_admin_level_t));
CNSTI4 1060
ARGI4
ADDRLP4 12
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 654
;654:    l->level = i;
ADDRLP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 655
;655:    *l->name = '\0';
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI1 0
ASGNI1
line 656
;656:    *l->flags = '\0';
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
CNSTI1 0
ASGNI1
line 657
;657:    g_admin_levels[i] = l;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 658
;658:  }
LABELV $499
line 651
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LEI4 $498
line 660
;659:
;660:  Q_strncpyz(g_admin_levels[0]->name, "^4Unknown Player", sizeof(l->name));
ADDRGP4 g_admin_levels
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 $502
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 661
;661:  Q_strncpyz(g_admin_levels[0]->flags, "listplayers admintest help specme time", sizeof(l->flags));
ADDRGP4 g_admin_levels
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 $503
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 663
;662:
;663:  Q_strncpyz(g_admin_levels[1]->name, "^5Server Regular", sizeof(l->name));
ADDRGP4 g_admin_levels+4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 $505
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 664
;664:  Q_strncpyz(g_admin_levels[1]->flags, "listplayers admintest help specme time", sizeof(l->flags));
ADDRGP4 g_admin_levels+4
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 $503
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 666
;665:
;666:  Q_strncpyz(g_admin_levels[2]->name, "^6Team Manager", sizeof(l->name));
ADDRGP4 g_admin_levels+8
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 $508
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 667
;667:  Q_strncpyz(g_admin_levels[2]->flags, "listplayers admintest help specme time putteam spec999 warn denybuild", sizeof(l->flags));
ADDRGP4 g_admin_levels+8
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 $510
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 669
;668:
;669:  Q_strncpyz(g_admin_levels[3]->name, "^2Junior Admin", sizeof(l->name));
ADDRGP4 g_admin_levels+12
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 $512
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 670
;670:  Q_strncpyz(g_admin_levels[3]->flags, "listplayers admintest help specme time putteam spec999 kick mute warn "
ADDRGP4 g_admin_levels+12
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 $514
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 673
;671:    "denybuild ADMINCHAT SEESFULLLISTPLAYERS", sizeof(l->flags));
;672:
;673:  Q_strncpyz(g_admin_levels[4]->name, "^3Senior Admin", sizeof(l->name));
ADDRGP4 g_admin_levels+16
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 $516
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 674
;674:  Q_strncpyz(g_admin_levels[4]->flags, "listplayers admintest help specme time putteam spec999 kick mute showbans "
ADDRGP4 g_admin_levels+16
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 $518
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 677
;675:    "ban namelog warn denybuild ADMINCHAT SEESFULLLISTPLAYERS", sizeof(l->flags));
;676:
;677:  Q_strncpyz(g_admin_levels[5]->name, "^1Server Operator", sizeof(l->name));
ADDRGP4 g_admin_levels+20
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 $520
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 678
;678:  Q_strncpyz(g_admin_levels[5]->flags, "ALLFLAGS -INCOGNITO -IMMUTABLE -DBUILDER -BANIMMUNITY", sizeof(l->flags));
ADDRGP4 g_admin_levels+20
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 $522
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 679
;679:}
LABELV $492
endproc admin_default_levels 16 12
export G_admin_level
proc G_admin_level 12 8
line 685
;680:
;681://  return a level for a player entity.
;682:
;683:int
;684:G_admin_level(gentity_t *ent)
;685:{
line 687
;686:  int i;
;687:  qboolean found = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 689
;688:
;689:  if (!ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $524
line 690
;690:  {
line 691
;691:    return MAX_ADMIN_LEVELS;
CNSTI4 32
RETI4
ADDRGP4 $523
JUMPV
LABELV $524
line 694
;692:  }
;693:
;694:  for(i = 0;i < MAX_ADMIN_ADMINS && g_admin_admins[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $529
JUMPV
LABELV $526
line 695
;695:  {
line 696
;696:    if (!Q_stricmp(g_admin_admins[i]->guid, ent->client->pers.guid))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $530
line 697
;697:    {
line 699
;698:
;699:      found = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 700
;700:      break;
ADDRGP4 $528
JUMPV
LABELV $530
line 702
;701:    }
;702:  }
LABELV $527
line 694
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $529
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $532
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $526
LABELV $532
LABELV $528
line 704
;703:
;704:  if (found)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $533
line 705
;705:  {
line 706
;706:    return g_admin_admins[i]->level;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
RETI4
ADDRGP4 $523
JUMPV
LABELV $533
line 709
;707:  }
;708:
;709:  return 0;
CNSTI4 0
RETI4
LABELV $523
endproc G_admin_level 12 8
export G_admin_set_adminname
proc G_admin_set_adminname 12 12
line 716
;710:}
;711:
;712://  set a player's adminname
;713:
;714:void
;715:G_admin_set_adminname(gentity_t *ent)
;716:{
line 718
;717:  int i;
;718:  qboolean found = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 720
;719:
;720:  if (!ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $536
line 721
;721:  {
line 722
;722:    return;
ADDRGP4 $535
JUMPV
LABELV $536
line 725
;723:  }
;724:
;725:  for(i = 0;i < MAX_ADMIN_ADMINS && g_admin_admins[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $541
JUMPV
LABELV $538
line 726
;726:  {
line 727
;727:    if (!Q_stricmp(g_admin_admins[i]->guid, ent->client->pers.guid))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $542
line 728
;728:    {
line 729
;729:      found = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 730
;730:      break;
ADDRGP4 $540
JUMPV
LABELV $542
line 732
;731:    }
;732:  }
LABELV $539
line 725
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $541
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $544
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $538
LABELV $544
LABELV $540
line 734
;733:
;734:  if (found)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $545
line 735
;735:  {
line 736
;736:    Q_strncpyz(ent->client->pers.adminName, g_admin_admins[i]->name, sizeof(ent->client->pers.adminName));
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 33
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 737
;737:	  ent->client->pers.adminlevel = g_admin_admins[i]->level;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 764
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 738
;738:  }
ADDRGP4 $546
JUMPV
LABELV $545
line 740
;739:  else
;740:  {
line 741
;741:    Q_strncpyz(ent->client->pers.adminName, "", sizeof(ent->client->pers.adminName));
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
ARGP4
ADDRGP4 $93
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 742
;742:	  ent->client->pers.adminlevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 0
ASGNI4
line 743
;743:  }
LABELV $546
line 745
;744:	
;745:}
LABELV $535
endproc G_admin_set_adminname 12 12
export G_admin_get_adminname
proc G_admin_get_adminname 12 8
line 751
;746:
;747://  Get an admin's registered name
;748:
;749:const char *
;750:G_admin_get_adminname(gentity_t *ent)
;751:{
line 754
;752:  int i;
;753:
;754:  if (!ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $548
line 755
;755:    return "console";
ADDRGP4 $342
RETP4
ADDRGP4 $547
JUMPV
LABELV $548
line 757
;756:
;757:  for(i = 0;i < MAX_ADMIN_ADMINS && g_admin_admins[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $553
JUMPV
LABELV $550
line 758
;758:  {
line 759
;759:    if (!Q_stricmp(g_admin_admins[i]->guid, ent->client->pers.guid))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $554
line 760
;760:      return g_admin_admins[i]->name;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 33
ADDP4
RETP4
ADDRGP4 $547
JUMPV
LABELV $554
line 761
;761:  }
LABELV $551
line 757
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $553
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $556
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $550
LABELV $556
line 763
;762:
;763:  return ent->client->pers.netname;
ADDRLP4 8
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
RETP4
LABELV $547
endproc G_admin_get_adminname 12 8
export G_admin_adminPrintName
proc G_admin_adminPrintName 12 8
line 771
;764:}
;765:
;766:// Get an admin's name to print as the user of various commands,
;767:// obeying admin stealth settings when necessary
;768:
;769:char*
;770:G_admin_adminPrintName(gentity_t *ent)
;771:{
line 774
;772:  char *out;
;773:
;774:  if (!ent->client->pers.adminLevel)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
CNSTI4 0
NEI4 $558
line 775
;775:  {
line 776
;776:    out = "";
ADDRLP4 0
ADDRGP4 $93
ASGNP4
line 777
;777:    return out;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $557
JUMPV
LABELV $558
line 780
;778:  }
;779:
;780:  if (G_admin_permission(ent, ADMF_ADMINSTEALTH))
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $562
ARGP4
ADDRLP4 4
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $560
line 781
;781:  {
line 782
;782:    out = ent->client->pers.adminName;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
ASGNP4
line 783
;783:  }
ADDRGP4 $561
JUMPV
LABELV $560
line 785
;784:  else
;785:  {
line 786
;786:    out = ent->client->pers.netname;
ADDRLP4 8
CNSTI4 516
ASGNI4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
line 787
;787:  }
LABELV $561
line 789
;788:
;789:  return out;
ADDRLP4 0
INDIRP4
RETP4
LABELV $557
endproc G_admin_adminPrintName 12 8
proc admin_log 4468 60
line 794
;790:}
;791:
;792:static void
;793:admin_log(gentity_t *admin, char *cmd, int skiparg)
;794:{
line 802
;795:  fileHandle_t f;
;796:  int len, i, j;
;797:  char string[MAX_STRING_CHARS], decoloured[MAX_STRING_CHARS];
;798:  int min, tens, sec;
;799:  g_admin_admin_t *a;
;800:  g_admin_level_t *l;
;801:  char flags[MAX_ADMIN_FLAGS * 2];
;802:  gentity_t *victim = NULL;
ADDRLP4 3092
CNSTP4 0
ASGNP4
line 806
;803:  int pids[MAX_CLIENTS];
;804:  char name[MAX_NAME_LENGTH];
;805:
;806:  if (!g_adminLog.string[0])
ADDRGP4 g_adminLog+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $564
line 807
;807:    return;
ADDRGP4 $563
JUMPV
LABELV $564
line 809
;808:
;809:  len = trap_FS_FOpenFile(g_adminLog.string, &f, FS_APPEND);
ADDRGP4 g_adminLog+16
ARGP4
ADDRLP4 3096
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 4424
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 3108
ADDRLP4 4424
INDIRI4
ASGNI4
line 810
;810:  if (len < 0)
ADDRLP4 3108
INDIRI4
CNSTI4 0
GEI4 $568
line 811
;811:  {
line 812
;812:    G_Printf("admin_log: error could not open %s\n", g_adminLog.string);
ADDRGP4 $570
ARGP4
ADDRGP4 g_adminLog+16
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 813
;813:    return;
ADDRGP4 $563
JUMPV
LABELV $568
line 816
;814:  }
;815:
;816:  sec = (level.time - level.startTime) / 1000;
ADDRLP4 2064
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 817
;817:  min = sec / 60;
ADDRLP4 3100
ADDRLP4 2064
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 818
;818:  sec -= min * 60;
ADDRLP4 2064
ADDRLP4 2064
INDIRI4
CNSTI4 60
ADDRLP4 3100
INDIRI4
MULI4
SUBI4
ASGNI4
line 819
;819:  tens = sec / 10;
ADDRLP4 3104
ADDRLP4 2064
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 820
;820:  sec -= tens * 10;
ADDRLP4 2064
ADDRLP4 2064
INDIRI4
CNSTI4 10
ADDRLP4 3104
INDIRI4
MULI4
SUBI4
ASGNI4
line 822
;821:
;822:  *flags = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 823
;823:  if (admin)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $574
line 824
;824:  {
line 825
;825:    for(i = 0;i < MAX_ADMIN_ADMINS && g_admin_admins[i];i++)
ADDRLP4 2060
CNSTI4 0
ASGNI4
ADDRGP4 $579
JUMPV
LABELV $576
line 826
;826:    {
line 827
;827:      if (!Q_stricmp(g_admin_admins[i]->guid, admin->client->pers.guid))
ADDRLP4 2060
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 4428
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4428
INDIRI4
CNSTI4 0
NEI4 $580
line 828
;828:      {
line 830
;829:
;830:        a = g_admin_admins[i];
ADDRLP4 2052
ADDRLP4 2060
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ASGNP4
line 831
;831:        Q_strncpyz(flags, a->flags, sizeof(flags));
ADDRLP4 4
ARGP4
ADDRLP4 2052
INDIRP4
CNSTI4 72
ADDP4
ARGP4
CNSTI4 2048
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 832
;832:        for(j = 0;j < MAX_ADMIN_LEVELS && g_admin_levels[j];j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $585
JUMPV
LABELV $582
line 833
;833:        {
line 834
;834:          if (g_admin_levels[j]->level == a->level)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
INDIRI4
ADDRLP4 2052
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
NEI4 $586
line 835
;835:          {
line 836
;836:            l = g_admin_levels[j];
ADDRLP4 2056
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
ASGNP4
line 837
;837:            Q_strcat(flags, sizeof(flags), l->flags);
ADDRLP4 4
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2056
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 838
;838:            break;
ADDRGP4 $578
JUMPV
LABELV $586
line 840
;839:          }
;840:        }
LABELV $583
line 832
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $585
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $588
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $582
LABELV $588
line 841
;841:        break;
ADDRGP4 $578
JUMPV
LABELV $580
line 843
;842:      }
;843:    }
LABELV $577
line 825
ADDRLP4 2060
ADDRLP4 2060
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $579
ADDRLP4 2060
INDIRI4
CNSTI4 1024
GEI4 $589
ADDRLP4 2060
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $576
LABELV $589
LABELV $578
line 844
;844:  }
LABELV $574
line 846
;845:
;846:  if (G_SayArgc() > 1 + skiparg)
ADDRLP4 4428
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 4428
INDIRI4
ADDRFP4 8
INDIRI4
CNSTI4 1
ADDI4
LEI4 $590
line 847
;847:  {
line 848
;848:    G_SayArgv(1 + skiparg, name, sizeof(name));
ADDRFP4 8
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4136
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 849
;849:    if (G_ClientNumbersFromString(name, pids) == 1)
ADDRLP4 4136
ARGP4
ADDRLP4 4168
ARGP4
ADDRLP4 4432
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 4432
INDIRI4
CNSTI4 1
NEI4 $592
line 850
;850:    {
line 851
;851:      victim = &g_entities[pids[0]];
ADDRLP4 3092
CNSTI4 2476
ADDRLP4 4168
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 852
;852:    }
LABELV $592
line 853
;853:  }
LABELV $590
line 855
;854:
;855:  if (victim && Q_stricmp(cmd, "attempted"))
ADDRLP4 3092
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $594
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $596
ARGP4
ADDRLP4 4432
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4432
INDIRI4
CNSTI4 0
EQI4 $594
line 856
;856:  {
line 857
;857:    Com_sprintf(string, sizeof(string), "%3i:%i%i: %i: %s: %s (%s): %s: %s: %s: %s: \"%s\"\n", min, tens, sec, (admin) ? admin->s.clientNum : -1,
ADDRFP4 8
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 4452
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 2068
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $597
ARGP4
ADDRLP4 3100
INDIRI4
ARGI4
ADDRLP4 3104
INDIRI4
ARGI4
ADDRLP4 2064
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $603
ADDRLP4 4436
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $604
JUMPV
LABELV $603
ADDRLP4 4436
CNSTI4 -1
ASGNI4
LABELV $604
ADDRLP4 4436
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $605
ADDRLP4 4440
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ASGNP4
ADDRGP4 $606
JUMPV
LABELV $605
ADDRLP4 4440
ADDRGP4 $599
ASGNP4
LABELV $606
ADDRLP4 4440
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $607
ADDRLP4 4456
CNSTI4 516
ASGNI4
ADDRLP4 4444
ADDRFP4 0
INDIRP4
ADDRLP4 4456
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4456
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $608
JUMPV
LABELV $607
ADDRLP4 4444
ADDRGP4 $342
ASGNP4
LABELV $608
ADDRLP4 4444
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $609
ADDRLP4 4448
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
ASGNP4
ADDRGP4 $610
JUMPV
LABELV $609
ADDRLP4 4448
ADDRGP4 $342
ASGNP4
LABELV $610
ADDRLP4 4448
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4460
CNSTI4 516
ASGNI4
ADDRLP4 4464
ADDRLP4 3092
INDIRP4
ADDRLP4 4460
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4464
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 4464
INDIRP4
ADDRLP4 4460
INDIRI4
ADDP4
ARGP4
ADDRLP4 4452
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 860
;858:        (admin) ? admin->client->pers.guid : "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", (admin) ? admin->client->pers.netname : "console",
;859:        (admin) ? admin->client->pers.adminName : "console", flags, cmd, victim->client->pers.guid, victim->client->pers.netname, G_SayConcatArgs(2 + skiparg));
;860:  }
ADDRGP4 $595
JUMPV
LABELV $594
line 862
;861:  else
;862:  {
line 863
;863:    Com_sprintf(string, sizeof(string), "%3i:%i%i: %i: %s: %s (%s): %s: %s: \"%s\"\n", min, tens, sec, (admin) ? admin->s.clientNum : -1,
ADDRFP4 8
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4452
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 2068
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $611
ARGP4
ADDRLP4 3100
INDIRI4
ARGI4
ADDRLP4 3104
INDIRI4
ARGI4
ADDRLP4 2064
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $616
ADDRLP4 4436
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $617
JUMPV
LABELV $616
ADDRLP4 4436
CNSTI4 -1
ASGNI4
LABELV $617
ADDRLP4 4436
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $618
ADDRLP4 4440
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ASGNP4
ADDRGP4 $619
JUMPV
LABELV $618
ADDRLP4 4440
ADDRGP4 $599
ASGNP4
LABELV $619
ADDRLP4 4440
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $620
ADDRLP4 4456
CNSTI4 516
ASGNI4
ADDRLP4 4444
ADDRFP4 0
INDIRP4
ADDRLP4 4456
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4456
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $621
JUMPV
LABELV $620
ADDRLP4 4444
ADDRGP4 $342
ASGNP4
LABELV $621
ADDRLP4 4444
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $622
ADDRLP4 4448
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
ASGNP4
ADDRGP4 $623
JUMPV
LABELV $622
ADDRLP4 4448
ADDRGP4 $342
ASGNP4
LABELV $623
ADDRLP4 4448
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4452
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 866
;864:        (admin) ? admin->client->pers.guid : "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", (admin) ? admin->client->pers.netname : "console",
;865:        (admin) ? admin->client->pers.adminName : "console", flags, cmd, G_SayConcatArgs(1 + skiparg));
;866:  }
LABELV $595
line 868
;867:
;868:  if (g_decolourLogfiles.integer)
ADDRGP4 g_decolourLogfiles+12
INDIRI4
CNSTI4 0
EQI4 $624
line 869
;869:  {
line 870
;870:    G_DecolorString(string, decoloured);
ADDRLP4 2068
ARGP4
ADDRLP4 3112
ARGP4
ADDRGP4 G_DecolorString
CALLV
pop
line 871
;871:    trap_FS_Write(decoloured, strlen(decoloured), f);
ADDRLP4 3112
ARGP4
ADDRLP4 4436
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 3112
ARGP4
ADDRLP4 4436
INDIRI4
ARGI4
ADDRLP4 3096
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 872
;872:  }
ADDRGP4 $625
JUMPV
LABELV $624
line 874
;873:  else
;874:  {
line 875
;875:    trap_FS_Write(string, strlen(string), f);
ADDRLP4 2068
ARGP4
ADDRLP4 4436
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2068
ARGP4
ADDRLP4 4436
INDIRI4
ARGI4
ADDRLP4 3096
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 876
;876:  }
LABELV $625
line 877
;877:  trap_FS_FCloseFile(f);
ADDRLP4 3096
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 879
;878:
;879:  if (!Q_stricmp(cmd, "attempted"))
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $596
ARGP4
ADDRLP4 4436
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4436
INDIRI4
CNSTI4 0
NEI4 $627
line 880
;880:  {
line 881
;881:    Com_sprintf(string, sizeof(string), "%s^7 (%i) %s: %s", (admin) ? admin->client->pers.netname : "console", (admin) ? admin->s.clientNum : -1, cmd,
ADDRFP4 8
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4448
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 2068
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $629
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $632
ADDRLP4 4452
CNSTI4 516
ASGNI4
ADDRLP4 4440
ADDRFP4 0
INDIRP4
ADDRLP4 4452
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4452
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $633
JUMPV
LABELV $632
ADDRLP4 4440
ADDRGP4 $342
ASGNP4
LABELV $633
ADDRLP4 4440
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $634
ADDRLP4 4444
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $635
JUMPV
LABELV $634
ADDRLP4 4444
CNSTI4 -1
ASGNI4
LABELV $635
ADDRLP4 4444
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4448
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 883
;882:        G_SayConcatArgs(1 + skiparg));
;883:    G_AdminsPrintf("%s\n", string);
ADDRGP4 $636
ARGP4
ADDRLP4 2068
ARGP4
ADDRGP4 G_AdminsPrintf
CALLV
pop
line 884
;884:  }
LABELV $627
line 886
;885:
;886:  G_LogPrintf("Admin Command: %s^7 (%s): %s %s\n", (admin) ? admin->client->pers.netname : "console", (admin) ? admin->client->pers.adminName : "console", cmd,
ADDRFP4 8
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4448
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRGP4 $637
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $640
ADDRLP4 4452
CNSTI4 516
ASGNI4
ADDRLP4 4440
ADDRFP4 0
INDIRP4
ADDRLP4 4452
INDIRI4
ADDP4
INDIRP4
ADDRLP4 4452
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $641
JUMPV
LABELV $640
ADDRLP4 4440
ADDRGP4 $342
ASGNP4
LABELV $641
ADDRLP4 4440
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $642
ADDRLP4 4444
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1004
ADDP4
ASGNP4
ADDRGP4 $643
JUMPV
LABELV $642
ADDRLP4 4444
ADDRGP4 $342
ASGNP4
LABELV $643
ADDRLP4 4444
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4448
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 888
;887:      G_SayConcatArgs(1 + skiparg));
;888:}
LABELV $563
endproc admin_log 4468 60
lit
align 1
LABELV $645
byte 1 0
skip 31
align 1
LABELV $646
byte 1 0
skip 31
align 1
LABELV $647
byte 1 0
skip 31
code
proc admin_listadmins 168 24
line 892
;889:
;890:static int
;891:admin_listadmins(gentity_t *ent, int start, char *search, int minlevel)
;892:{
line 893
;893:  int drawn = 0;
ADDRLP4 132
CNSTI4 0
ASGNI4
line 896
;894:  char guid_stub[9];
;895:  char name[MAX_NAME_LENGTH] =
;896:  { "" };
ADDRLP4 100
ADDRGP4 $645
INDIRB
ASGNB 32
line 898
;897:  char name2[MAX_NAME_LENGTH] =
;898:  { "" };
ADDRLP4 68
ADDRGP4 $646
INDIRB
ASGNB 32
line 900
;899:  char lname[MAX_NAME_LENGTH] =
;900:  { "" };
ADDRLP4 4
ADDRGP4 $647
INDIRB
ASGNB 32
line 904
;901:  char lname_fmt[5];
;902:  int i, j;
;903:  gentity_t *vic;
;904:  int l = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
line 905
;905:  qboolean dup = qfalse;
ADDRLP4 136
CNSTI4 0
ASGNI4
line 907
;906:
;907:  ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 910
;908:
;909:  // print out all connected players regardless of level if name searching
;910:  for(i = 0;i < level.maxclients && search[0];i++)
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRGP4 $651
JUMPV
LABELV $648
line 911
;911:  {
line 912
;912:    vic = &g_entities[i];
ADDRLP4 36
CNSTI4 2476
ADDRLP4 48
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 914
;913:
;914:    if (vic->client && vic->client->pers.connected != CON_CONNECTED)
ADDRLP4 140
ADDRLP4 36
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $653
ADDRLP4 140
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $653
line 915
;915:      continue;
ADDRGP4 $649
JUMPV
LABELV $653
line 917
;916:
;917:    l = vic->client->pers.adminLevel;
ADDRLP4 64
ADDRLP4 36
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
ASGNI4
line 919
;918:
;919:    G_SanitiseString(vic->client->pers.netname, name, sizeof(name));
ADDRLP4 144
CNSTI4 516
ASGNI4
ADDRLP4 36
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
ARGP4
ADDRLP4 100
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 920
;920:    if (!strstr(name, search))
ADDRLP4 100
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 148
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $655
line 921
;921:      continue;
ADDRGP4 $649
JUMPV
LABELV $655
line 923
;922:
;923:    for(j = 0;j < 8;j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $657
line 924
;924:      guid_stub[j] = vic->client->pers.guid[j + 24];
ADDRLP4 0
INDIRI4
ADDRLP4 52
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 720
ADDP4
ADDP4
INDIRI1
ASGNI1
LABELV $658
line 923
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $657
line 925
;925:    guid_stub[j] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 52
ADDP4
CNSTI1 0
ASGNI1
line 927
;926:
;927:    lname[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 928
;928:    Q_strncpyz(lname_fmt, "%s", sizeof(lname_fmt));
ADDRLP4 40
ARGP4
ADDRGP4 $406
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 929
;929:    for(j = 0;j < MAX_ADMIN_LEVELS && g_admin_levels[j];j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $664
JUMPV
LABELV $661
line 930
;930:    {
line 931
;931:      if (g_admin_levels[j]->level == l)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $665
line 932
;932:      {
line 933
;933:        G_DecolorString(g_admin_levels[j]->name, lname);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_DecolorString
CALLV
pop
line 934
;934:        Com_sprintf(lname_fmt, sizeof(lname_fmt), "%%%is", (admin_level_maxname + strlen(g_admin_levels[j]->name) - strlen(lname)));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 156
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 160
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 40
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 $667
ARGP4
ADDRGP4 admin_level_maxname
INDIRI4
ADDRLP4 156
INDIRI4
ADDI4
ADDRLP4 160
INDIRI4
SUBI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 935
;935:        Com_sprintf(lname, sizeof(lname), lname_fmt, g_admin_levels[j]->name);
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 40
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 936
;936:        break;
ADDRGP4 $663
JUMPV
LABELV $665
line 938
;937:      }
;938:    }
LABELV $662
line 929
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $664
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $668
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $661
LABELV $668
LABELV $663
line 939
;939:    ADMBP(va("%4i %4i %s^7 (*%s) %s^7\n", i, l, lname, guid_stub,
ADDRGP4 $669
ARGP4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 160
CNSTI4 516
ASGNI4
ADDRLP4 36
INDIRP4
ADDRLP4 160
INDIRI4
ADDP4
INDIRP4
ADDRLP4 160
INDIRI4
ADDP4
ARGP4
ADDRLP4 164
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 941
;940:            vic->client->pers.netname));
;941:    drawn++;
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 942
;942:  }
LABELV $649
line 910
ADDRLP4 48
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $651
ADDRLP4 48
INDIRI4
ADDRGP4 level+20
INDIRI4
GEI4 $670
ADDRFP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $648
LABELV $670
line 944
;943:
;944:  for(i = start;i < MAX_ADMIN_ADMINS && g_admin_admins[i] && drawn < MAX_ADMIN_LISTITEMS;i++)
ADDRLP4 48
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $674
JUMPV
LABELV $671
line 945
;945:    if (g_admin_admins[i]->level >= minlevel)
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRFP4 12
INDIRI4
LTI4 $675
line 946
;946:    {
line 947
;947:      if (search[0])
ADDRFP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $677
line 948
;948:      {
line 949
;949:        G_SanitiseString(g_admin_admins[i]->name, name, sizeof(name));
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 33
ADDP4
ARGP4
ADDRLP4 100
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 950
;950:        if (!strstr(name, search))
ADDRLP4 100
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 140
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $679
line 951
;951:          continue;
ADDRGP4 $672
JUMPV
LABELV $679
line 955
;952:
;953:        // verify we don't have the same guid/name pair in connected players
;954:        // since we don't want to draw the same player twice
;955:        dup = qfalse;
ADDRLP4 136
CNSTI4 0
ASGNI4
line 956
;956:        for(j = 0;j < level.maxclients;j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $684
JUMPV
LABELV $681
line 957
;957:        {
line 958
;958:          vic = &g_entities[j];
ADDRLP4 36
CNSTI4 2476
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 959
;959:          if (!vic->client || vic->client->pers.connected != CON_CONNECTED)
ADDRLP4 144
ADDRLP4 36
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $688
ADDRLP4 144
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $686
LABELV $688
line 960
;960:            continue;
ADDRGP4 $682
JUMPV
LABELV $686
line 961
;961:          G_SanitiseString(vic->client->pers.netname, name2, sizeof(name2));
ADDRLP4 148
CNSTI4 516
ASGNI4
ADDRLP4 36
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
ARGP4
ADDRLP4 68
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 962
;962:          if (!Q_stricmp(vic->client->pers.guid, g_admin_admins[i]->guid) && strstr(name2, search))
ADDRLP4 36
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $689
ADDRLP4 68
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 156
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $689
line 963
;963:          {
line 964
;964:            dup = qtrue;
ADDRLP4 136
CNSTI4 1
ASGNI4
line 965
;965:            break;
ADDRGP4 $683
JUMPV
LABELV $689
line 967
;966:          }
;967:        }
LABELV $682
line 956
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $684
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $681
LABELV $683
line 968
;968:        if (dup)
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $691
line 969
;969:          continue;
ADDRGP4 $672
JUMPV
LABELV $691
line 970
;970:      }
LABELV $677
line 971
;971:      for(j = 0;j < 8;j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $693
line 972
;972:        guid_stub[j] = g_admin_admins[i]->guid[j + 24];
ADDRLP4 0
INDIRI4
ADDRLP4 52
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 24
ADDI4
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ADDP4
INDIRI1
ASGNI1
LABELV $694
line 971
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $693
line 973
;973:      guid_stub[j] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 52
ADDP4
CNSTI1 0
ASGNI1
line 975
;974:
;975:      lname[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 976
;976:      Q_strncpyz(lname_fmt, "%s", sizeof(lname_fmt));
ADDRLP4 40
ARGP4
ADDRGP4 $406
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 977
;977:      for(j = 0;j < MAX_ADMIN_LEVELS && g_admin_levels[j];j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $700
JUMPV
LABELV $697
line 978
;978:      {
line 979
;979:        if (g_admin_levels[j]->level == g_admin_admins[i]->level)
ADDRLP4 144
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 144
INDIRI4
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
INDIRI4
ADDRLP4 48
INDIRI4
ADDRLP4 144
INDIRI4
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
NEI4 $701
line 980
;980:        {
line 981
;981:          G_DecolorString(g_admin_levels[j]->name, lname);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_DecolorString
CALLV
pop
line 982
;982:          Com_sprintf(lname_fmt, sizeof(lname_fmt), "%%%is", (admin_level_maxname + strlen(g_admin_levels[j]->name) - strlen(lname)));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 148
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 152
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 40
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 $667
ARGP4
ADDRGP4 admin_level_maxname
INDIRI4
ADDRLP4 148
INDIRI4
ADDI4
ADDRLP4 152
INDIRI4
SUBI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 983
;983:          Com_sprintf(lname, sizeof(lname), lname_fmt, g_admin_levels[j]->name);
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 40
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 984
;984:          break;
ADDRGP4 $699
JUMPV
LABELV $701
line 986
;985:        }
;986:      }
LABELV $698
line 977
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $700
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $703
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $697
LABELV $703
LABELV $699
line 987
;987:      ADMBP(va("%4i %4i %s^7 (*%s) %s^7\n", (i + MAX_CLIENTS),
ADDRGP4 $669
ARGP4
ADDRLP4 48
INDIRI4
CNSTI4 64
ADDI4
ARGI4
ADDRLP4 152
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 152
INDIRP4
CNSTI4 33
ADDP4
ARGP4
ADDRLP4 156
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 989
;988:              g_admin_admins[i]->level, lname, guid_stub, g_admin_admins[i]->name));
;989:      drawn++;
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 990
;990:    }
LABELV $675
LABELV $672
line 944
ADDRLP4 48
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $674
ADDRLP4 48
INDIRI4
CNSTI4 1024
GEI4 $705
ADDRLP4 48
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $705
ADDRLP4 132
INDIRI4
CNSTI4 20
LTI4 $671
LABELV $705
line 991
;991:  ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 992
;992:  return drawn;
ADDRLP4 132
INDIRI4
RETI4
LABELV $644
endproc admin_listadmins 168 24
export G_admin_duration
proc G_admin_duration 4 16
line 997
;993:}
;994:
;995:void
;996:G_admin_duration(int secs, char *duration, int dursize)
;997:{
line 999
;998:
;999:  if (secs > (60 * 60 * 24 * 365 * 50) || secs < 0)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1576800000
GTI4 $709
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $707
LABELV $709
line 1000
;1000:    Q_strncpyz(duration, "PERMANENT", dursize);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $710
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $708
JUMPV
LABELV $707
line 1001
;1001:  else if (secs >= (60 * 60 * 24 * 365))
ADDRFP4 0
INDIRI4
CNSTI4 31536000
LTI4 $711
line 1002
;1002:    Com_sprintf(duration, dursize, "%1.1f years", (secs / (60 * 60 * 24 * 365.0f)));
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $713
ARGP4
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1274059200
DIVF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $712
JUMPV
LABELV $711
line 1003
;1003:  else if (secs >= (60 * 60 * 24 * 90))
ADDRFP4 0
INDIRI4
CNSTI4 7776000
LTI4 $714
line 1004
;1004:    Com_sprintf(duration, dursize, "%1.1f weeks", (secs / (60 * 60 * 24 * 7.0f)));
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $716
ARGP4
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1226024960
DIVF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $715
JUMPV
LABELV $714
line 1005
;1005:  else if (secs >= (60 * 60 * 24))
ADDRFP4 0
INDIRI4
CNSTI4 86400
LTI4 $717
line 1006
;1006:    Com_sprintf(duration, dursize, "%1.1f days", (secs / (60 * 60 * 24.0f)));
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $719
ARGP4
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1202241536
DIVF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $718
JUMPV
LABELV $717
line 1007
;1007:  else if (secs >= (60 * 60))
ADDRFP4 0
INDIRI4
CNSTI4 3600
LTI4 $720
line 1008
;1008:    Com_sprintf(duration, dursize, "%1.1f hours", (secs / (60 * 60.0f)));
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $722
ARGP4
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1163984896
DIVF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $721
JUMPV
LABELV $720
line 1009
;1009:  else if (secs >= 60)
ADDRFP4 0
INDIRI4
CNSTI4 60
LTI4 $723
line 1010
;1010:    Com_sprintf(duration, dursize, "%1.1f minutes", (secs / 60.0f));
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $725
ARGP4
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1114636288
DIVF4
ARGF4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $724
JUMPV
LABELV $723
line 1012
;1011:  else
;1012:    Com_sprintf(duration, dursize, "%i seconds", secs);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $726
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $724
LABELV $721
LABELV $718
LABELV $715
LABELV $712
LABELV $708
line 1013
;1013:}
LABELV $706
endproc G_admin_duration 4 16
data
align 1
LABELV $728
byte 1 0
skip 15
align 4
LABELV $729
byte 4 0
export G_admin_ban_check
code
proc G_admin_ban_check 248 32
line 1017
;1014:
;1015:qboolean
;1016:G_admin_ban_check(char *userinfo, char *reason, int rlen)
;1017:{
line 1025
;1018:  static char lastConnectIP[16] =
;1019:  { "" };
;1020:  static int lastConnectTime = 0;
;1021:  char guid[33];
;1022:  char ip[16];
;1023:  char *value;
;1024:  int i;
;1025:  unsigned int userIP = 0, intIP = 0, tempIP;
ADDRLP4 76
CNSTU4 0
ASGNU4
ADDRLP4 28
CNSTU4 0
ASGNU4
line 1029
;1026:  int IP[5], k, mask, ipscanfcount;
;1027:  int t;
;1028:  char notice[51];
;1029:  qboolean ignoreIP = qfalse;
ADDRLP4 104
CNSTI4 0
ASGNI4
line 1031
;1030:
;1031:  trap_Cvar_VariableStringBuffer("g_banNotice", notice, sizeof(notice));
ADDRGP4 $730
ARGP4
ADDRLP4 112
ARGP4
CNSTI4 51
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1033
;1032:
;1033:  *reason = '\0';
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 1035
;1034:
;1035:  if (!*userinfo)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $731
line 1036
;1036:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $727
JUMPV
LABELV $731
line 1038
;1037:
;1038:  value = Info_ValueForKey(userinfo, "ip");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $733
ARGP4
ADDRLP4 164
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 108
ADDRLP4 164
INDIRP4
ASGNP4
line 1039
;1039:  Q_strncpyz(ip, value, sizeof(ip));
ADDRLP4 84
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1041
;1040:  // strip port
;1041:  value = strchr(ip, ':');
ADDRLP4 84
ARGP4
CNSTI4 58
ARGI4
ADDRLP4 168
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 108
ADDRLP4 168
INDIRP4
ASGNP4
line 1042
;1042:  if (value)
ADDRLP4 108
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $734
line 1043
;1043:    *value = '\0';
ADDRLP4 108
INDIRP4
CNSTI1 0
ASGNI1
LABELV $734
line 1045
;1044:
;1045:  if (!*ip)
ADDRLP4 84
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $736
line 1046
;1046:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $727
JUMPV
LABELV $736
line 1048
;1047:
;1048:  value = Info_ValueForKey(userinfo, "cl_guid");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $738
ARGP4
ADDRLP4 172
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 108
ADDRLP4 172
INDIRP4
ASGNP4
line 1049
;1049:  Q_strncpyz(guid, value, sizeof(guid));
ADDRLP4 36
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1051
;1050:
;1051:  t = trap_RealTime(NULL);
CNSTP4 0
ARGP4
ADDRLP4 176
ADDRGP4 trap_RealTime
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 176
INDIRI4
ASGNI4
line 1052
;1052:  memset(IP, 0, sizeof(IP));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1053
;1053:  sscanf(ip, "%i.%i.%i.%i", &IP[4], &IP[3], &IP[2], &IP[1]);
ADDRLP4 84
ARGP4
ADDRGP4 $739
ARGP4
ADDRLP4 4+16
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 4+8
ARGP4
ADDRLP4 4+4
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 1054
;1054:  for(k = 4;k >= 1;k--)
ADDRLP4 0
CNSTI4 4
ASGNI4
LABELV $744
line 1055
;1055:  {
line 1056
;1056:    if (!IP[k])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $748
line 1057
;1057:      continue;
ADDRGP4 $745
JUMPV
LABELV $748
line 1058
;1058:    userIP |= IP[k] << 8 * (k - 1);
ADDRLP4 76
ADDRLP4 76
INDIRU4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 8
SUBI4
LSHI4
CVIU4 4
BORU4
ASGNU4
line 1059
;1059:  }
LABELV $745
line 1054
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
GEI4 $744
line 1060
;1060:  ignoreIP = G_admin_permission_guid(guid, ADMF_BAN_IMMUNITY);
ADDRLP4 36
ARGP4
ADDRGP4 $750
ARGP4
ADDRLP4 180
ADDRGP4 G_admin_permission_guid
CALLI4
ASGNI4
ADDRLP4 104
ADDRLP4 180
INDIRI4
ASGNI4
line 1061
;1061:  for(i = 0;i < MAX_ADMIN_BANS && g_admin_bans[i];i++)
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 $754
JUMPV
LABELV $751
line 1062
;1062:  {
line 1064
;1063:    // 0 is for perm ban
;1064:    if (g_admin_bans[i]->expires != 0 && (g_admin_bans[i]->expires - t) < 1)
ADDRLP4 184
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $755
ADDRLP4 184
INDIRI4
ADDRLP4 72
INDIRI4
SUBI4
CNSTI4 1
GEI4 $755
line 1065
;1065:      continue;
ADDRGP4 $752
JUMPV
LABELV $755
line 1066
;1066:    if (!ignoreIP)
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $757
line 1067
;1067:    {
line 1068
;1068:      tempIP = userIP;
ADDRLP4 100
ADDRLP4 76
INDIRU4
ASGNU4
line 1069
;1069:      intIP = 0;
ADDRLP4 28
CNSTU4 0
ASGNU4
line 1070
;1070:      mask = -1;
ADDRLP4 32
CNSTI4 -1
ASGNI4
line 1072
;1071:
;1072:      memset(IP, 0, sizeof(IP));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1073
;1073:      ipscanfcount = sscanf(g_admin_bans[i]->ip, "%d.%d.%d.%d/%d", &IP[4], &IP[3], &IP[2], &IP[1], &IP[0]);
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRGP4 $759
ARGP4
ADDRLP4 4+16
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 4+8
ARGP4
ADDRLP4 4+4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 188
ADDRGP4 sscanf
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 188
INDIRI4
ASGNI4
line 1075
;1074:
;1075:      if (ipscanfcount == 4)
ADDRLP4 80
INDIRI4
CNSTI4 4
NEI4 $764
line 1076
;1076:        mask = -1;
ADDRLP4 32
CNSTI4 -1
ASGNI4
ADDRGP4 $765
JUMPV
LABELV $764
line 1077
;1077:      else if (ipscanfcount == 5)
ADDRLP4 80
INDIRI4
CNSTI4 5
NEI4 $766
line 1078
;1078:        mask = IP[0];
ADDRLP4 32
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $767
JUMPV
LABELV $766
line 1079
;1079:      else if (ipscanfcount > 0 && ipscanfcount < 4)
ADDRLP4 80
INDIRI4
CNSTI4 0
LEI4 $752
ADDRLP4 80
INDIRI4
CNSTI4 4
GEI4 $752
line 1080
;1080:        mask = 8 * ipscanfcount;
ADDRLP4 32
ADDRLP4 80
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 1082
;1081:      else
;1082:        continue;
LABELV $769
LABELV $767
LABELV $765
line 1084
;1083:
;1084:      for(k = 4;k >= 1;k--)
ADDRLP4 0
CNSTI4 4
ASGNI4
LABELV $770
line 1085
;1085:      {
line 1086
;1086:        if (!IP[k])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $774
line 1087
;1087:          continue;
ADDRGP4 $771
JUMPV
LABELV $774
line 1088
;1088:        intIP |= IP[k] << 8 * (k - 1);
ADDRLP4 28
ADDRLP4 28
INDIRU4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 8
SUBI4
LSHI4
CVIU4 4
BORU4
ASGNU4
line 1089
;1089:      }
LABELV $771
line 1084
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
GEI4 $770
line 1091
;1090:
;1091:      if (mask > 0 && mask <= 32)
ADDRLP4 32
INDIRI4
CNSTI4 0
LEI4 $776
ADDRLP4 32
INDIRI4
CNSTI4 32
GTI4 $776
line 1092
;1092:      {
line 1093
;1093:        tempIP &= ~((1 << (32 - mask)) - 1);
ADDRLP4 200
CNSTI4 1
ASGNI4
ADDRLP4 100
ADDRLP4 100
INDIRU4
ADDRLP4 200
INDIRI4
CNSTI4 32
ADDRLP4 32
INDIRI4
SUBI4
LSHI4
ADDRLP4 200
INDIRI4
SUBI4
BCOMI4
CVIU4 4
BANDU4
ASGNU4
line 1094
;1094:        intIP &= ~((1 << (32 - mask)) - 1);
ADDRLP4 204
CNSTI4 1
ASGNI4
ADDRLP4 28
ADDRLP4 28
INDIRU4
ADDRLP4 204
INDIRI4
CNSTI4 32
ADDRLP4 32
INDIRI4
SUBI4
LSHI4
ADDRLP4 204
INDIRI4
SUBI4
BCOMI4
CVIU4 4
BANDU4
ASGNU4
line 1095
;1095:      }
LABELV $776
line 1097
;1096:
;1097:      if (intIP == tempIP || mask == 0)
ADDRLP4 28
INDIRU4
ADDRLP4 100
INDIRU4
EQU4 $780
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $778
LABELV $780
line 1098
;1098:      {
line 1100
;1099:        char duration[32];
;1100:        G_admin_duration((g_admin_bans[i]->expires - t), duration, sizeof(duration));
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
SUBI4
ARGI4
ADDRLP4 200
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_admin_duration
CALLV
pop
line 1103
;1101:
;1102:        // flood protected
;1103:        if (t - lastConnectTime >= 300 || Q_stricmp(lastConnectIP, ip))
ADDRLP4 72
INDIRI4
ADDRGP4 $729
INDIRI4
SUBI4
CNSTI4 300
GEI4 $783
ADDRGP4 $728
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 232
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 0
EQI4 $781
LABELV $783
line 1104
;1104:        {
line 1105
;1105:          lastConnectTime = t;
ADDRGP4 $729
ADDRLP4 72
INDIRI4
ASGNI4
line 1106
;1106:          Q_strncpyz(lastConnectIP, ip, sizeof(lastConnectIP));
ADDRGP4 $728
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1108
;1107:
;1108:          G_AdminsPrintf("Banned player %s^7 (%s^7) tried to connect (ban #%i on %s by %s^7 expires %s reason: %s^7 )\n", Info_ValueForKey(userinfo, "name"),
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $785
ARGP4
ADDRLP4 236
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $784
ARGP4
ADDRLP4 236
INDIRP4
ARGP4
ADDRLP4 244
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ASGNP4
ADDRLP4 244
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 84
ARGP4
ADDRLP4 244
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 200
ARGP4
ADDRLP4 244
INDIRP4
CNSTI4 85
ADDP4
ARGP4
ADDRGP4 G_AdminsPrintf
CALLV
pop
line 1110
;1109:              g_admin_bans[i]->name, i + 1, ip, g_admin_bans[i]->banner, duration, g_admin_bans[i]->reason);
;1110:        }
LABELV $781
line 1112
;1111:
;1112:        Com_sprintf(reason, rlen, "You have been banned by %s^7 reason: %s^7 expires: %s       %s", g_admin_bans[i]->banner, g_admin_bans[i]->reason, duration,
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $786
ARGP4
ADDRLP4 236
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ASGNP4
ADDRLP4 236
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 236
INDIRP4
CNSTI4 85
ADDP4
ARGP4
ADDRLP4 200
ARGP4
ADDRLP4 112
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1114
;1113:            notice);
;1114:        G_LogPrintf("Banned player tried to connect from IP %s\n", ip);
ADDRGP4 $787
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1115
;1115:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $727
JUMPV
LABELV $778
line 1117
;1116:      }
;1117:    }
LABELV $757
line 1118
;1118:    if (*guid && !Q_stricmp(g_admin_bans[i]->guid, guid))
ADDRLP4 36
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $788
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 188
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
NEI4 $788
line 1119
;1119:    {
line 1121
;1120:      char duration[32];
;1121:      G_admin_duration((g_admin_bans[i]->expires - t), duration, sizeof(duration));
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
SUBI4
ARGI4
ADDRLP4 192
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_admin_duration
CALLV
pop
line 1122
;1122:      Com_sprintf(reason, rlen, "You have been banned by %s^7 reason: %s^7 expires: %s", g_admin_bans[i]->banner, g_admin_bans[i]->reason, duration);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $790
ARGP4
ADDRLP4 224
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ASGNP4
ADDRLP4 224
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 224
INDIRP4
CNSTI4 85
ADDP4
ARGP4
ADDRLP4 192
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1123
;1123:      G_Printf("Banned player tried to connect with GUID %s\n", guid);
ADDRGP4 $791
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1124
;1124:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $727
JUMPV
LABELV $788
line 1126
;1125:    }
;1126:  }
LABELV $752
line 1061
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $754
ADDRLP4 24
INDIRI4
CNSTI4 1024
GEI4 $792
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $751
LABELV $792
line 1127
;1127:  return qfalse;
CNSTI4 0
RETI4
LABELV $727
endproc G_admin_ban_check 248 32
export G_admin_cmd_check
proc G_admin_cmd_check 64 12
line 1132
;1128:}
;1129:
;1130:qboolean
;1131:G_admin_cmd_check(gentity_t *ent, qboolean say)
;1132:{
line 1136
;1133:  int i;
;1134:  char command[MAX_ADMIN_CMD_LEN];
;1135:  char *cmd;
;1136:  int skip = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1138
;1137:
;1138:  command[0] = '\0';
ADDRLP4 12
CNSTI1 0
ASGNI1
line 1139
;1139:  G_SayArgv(0, command, sizeof(command));
CNSTI4 0
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 1140
;1140:  if (!Q_stricmp(command, "say") || (G_admin_permission(ent, ADMF_TEAMCHAT_CMD) && (!Q_stricmp(command, "say_team"))))
ADDRLP4 12
ARGP4
ADDRGP4 $796
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $799
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $797
ARGP4
ADDRLP4 36
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $794
ADDRLP4 12
ARGP4
ADDRGP4 $798
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $794
LABELV $799
line 1141
;1141:  {
line 1142
;1142:    skip = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 1143
;1143:    G_SayArgv(1, command, sizeof(command));
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 1144
;1144:  }
LABELV $794
line 1145
;1145:  if (!command[0])
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $800
line 1146
;1146:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $793
JUMPV
LABELV $800
line 1148
;1147:
;1148:  if (command[0] == '!')
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 33
NEI4 $802
line 1149
;1149:  {
line 1150
;1150:    cmd = &command[1];
ADDRLP4 4
ADDRLP4 12+1
ASGNP4
line 1151
;1151:  }
ADDRGP4 $803
JUMPV
LABELV $802
line 1153
;1152:  else
;1153:  {
line 1154
;1154:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $793
JUMPV
LABELV $803
line 1158
;1155:  }
;1156:
;1157:  // Flood limit.  If they're talking too fast, determine that and return.
;1158:  if (g_floodMinTime.integer)
ADDRGP4 g_floodMinTime+12
INDIRI4
CNSTI4 0
EQI4 $805
line 1159
;1159:    if (G_Flood_Limited(ent))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 G_Flood_Limited
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $808
line 1160
;1160:    {
line 1161
;1161:      trap_SendServerCommand(ent - g_entities, "print \"Your chat is flood-limited; wait before chatting again\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $810
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1162
;1162:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $793
JUMPV
LABELV $808
LABELV $805
line 1165
;1163:    }
;1164:
;1165:  for(i = 0;i < MAX_ADMIN_COMMANDS && g_admin_commands[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $814
JUMPV
LABELV $811
line 1166
;1166:  {
line 1167
;1167:    if (Q_stricmp(cmd, g_admin_commands[i]->command))
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $815
line 1168
;1168:      continue;
ADDRGP4 $812
JUMPV
LABELV $815
line 1170
;1169:
;1170:    if (G_admin_permission(ent, g_admin_commands[i]->flag))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CNSTI4 134
ADDP4
ARGP4
ADDRLP4 52
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $817
line 1171
;1171:    {
line 1172
;1172:      trap_SendConsoleCommand(EXEC_APPEND, g_admin_commands[i]->exec);
ADDRLP4 56
CNSTI4 2
ASGNI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 56
INDIRI4
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1173
;1173:      admin_log(ent, cmd, skip);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 admin_log
CALLV
pop
line 1174
;1174:    }
ADDRGP4 $818
JUMPV
LABELV $817
line 1176
;1175:    else
;1176:    {
line 1177
;1177:      ADMP(va("^3!%s: ^7permission denied\n", g_admin_commands[i]->command));
ADDRGP4 $819
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1178
;1178:      admin_log(ent, "attempted", skip - 1);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $596
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 admin_log
CALLV
pop
line 1179
;1179:    }
LABELV $818
line 1180
;1180:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $793
JUMPV
LABELV $812
line 1165
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $814
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $820
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $811
LABELV $820
line 1183
;1181:  }
;1182:
;1183:  for(i = 0;i < adminNumCmds;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $824
JUMPV
LABELV $821
line 1184
;1184:  {
line 1185
;1185:    if (Q_stricmp(cmd, g_admin_cmds[i].keyword))
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds
ADDP4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $825
line 1186
;1186:      continue;
ADDRGP4 $822
JUMPV
LABELV $825
line 1188
;1187:
;1188:    if (G_admin_permission(ent, g_admin_cmds[i].flag))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $827
line 1189
;1189:    {
line 1190
;1190:      g_admin_cmds[i].handler(ent, skip);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds+4
ADDP4
INDIRP4
CALLI4
pop
line 1191
;1191:      admin_log(ent, cmd, skip);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 admin_log
CALLV
pop
line 1192
;1192:    }
ADDRGP4 $828
JUMPV
LABELV $827
line 1194
;1193:    else
;1194:    {
line 1195
;1195:      ADMP(va("^3!%s: ^7permission denied\n", g_admin_cmds[i].keyword));
ADDRGP4 $819
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds
ADDP4
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1196
;1196:      admin_log(ent, "attempted", skip - 1);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $596
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 admin_log
CALLV
pop
line 1197
;1197:    }
LABELV $828
line 1198
;1198:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $793
JUMPV
LABELV $822
line 1183
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $824
ADDRLP4 0
INDIRI4
ADDRGP4 adminNumCmds
INDIRI4
LTI4 $821
line 1200
;1199:  }
;1200:  return qfalse;
CNSTI4 0
RETI4
LABELV $793
endproc G_admin_cmd_check 64 12
export G_admin_namelog_cleanup
proc G_admin_namelog_cleanup 8 4
line 1205
;1201:}
;1202:
;1203:void
;1204:G_admin_namelog_cleanup()
;1205:{
line 1208
;1206:  int i;
;1207:
;1208:  for(i = 0;i < MAX_ADMIN_NAMELOGS && g_admin_namelog[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $835
JUMPV
LABELV $832
line 1209
;1209:  {
line 1210
;1210:    G_Free(g_admin_namelog[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Free
CALLV
pop
line 1211
;1211:    g_admin_namelog[i] = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
CNSTP4 0
ASGNP4
line 1212
;1212:  }
LABELV $833
line 1208
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $835
ADDRLP4 0
INDIRI4
CNSTI4 128
GEI4 $836
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $832
LABELV $836
line 1213
;1213:}
LABELV $831
endproc G_admin_namelog_cleanup 8 4
export G_admin_namelog_update
proc G_admin_namelog_update 104 12
line 1217
;1214:
;1215:void
;1216:G_admin_namelog_update(gclient_t *client, qboolean disconnect)
;1217:{
line 1222
;1218:  int i, j;
;1219:  g_admin_namelog_t *namelog;
;1220:  char n1[MAX_NAME_LENGTH];
;1221:  char n2[MAX_NAME_LENGTH];
;1222:  int clientNum = (client - level.clients);
ADDRLP4 72
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2148
DIVI4
ASGNI4
line 1224
;1223:
;1224:  G_SanitiseString(client->pers.netname, n1, sizeof(n1));
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 1225
;1225:  for(i = 0;i < MAX_ADMIN_NAMELOGS && g_admin_namelog[i];i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $841
JUMPV
LABELV $838
line 1226
;1226:  {
line 1227
;1227:    if (disconnect && g_admin_namelog[i]->slot != clientNum)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $842
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $842
line 1228
;1228:      continue;
ADDRGP4 $839
JUMPV
LABELV $842
line 1230
;1229:
;1230:    if (!disconnect && !(g_admin_namelog[i]->slot == clientNum || g_admin_namelog[i]->slot == -1))
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $844
ADDRLP4 80
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $844
ADDRLP4 80
INDIRI4
CNSTI4 -1
EQI4 $844
line 1231
;1231:    {
line 1232
;1232:      continue;
ADDRGP4 $839
JUMPV
LABELV $844
line 1235
;1233:    }
;1234:
;1235:    if (!Q_stricmp(client->pers.ip, g_admin_namelog[i]->ip) && !Q_stricmp(client->pers.guid, g_admin_namelog[i]->guid))
ADDRFP4 0
INDIRP4
CNSTI4 729
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $846
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $846
line 1236
;1236:    {
line 1237
;1237:      for(j = 0;j < MAX_ADMIN_NAMELOG_NAMES && g_admin_namelog[i]->name[j][0];j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $851
JUMPV
LABELV $848
line 1238
;1238:      {
line 1239
;1239:        G_SanitiseString(g_admin_namelog[i]->name[j], n2, sizeof(n2));
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 1240
;1240:        if (!Q_stricmp(n1, n2))
ADDRLP4 40
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $852
line 1241
;1241:          break;
ADDRGP4 $850
JUMPV
LABELV $852
line 1242
;1242:      }
LABELV $849
line 1237
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $851
ADDRLP4 96
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
GEI4 $854
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $848
LABELV $854
LABELV $850
line 1243
;1243:      if (j == MAX_ADMIN_NAMELOG_NAMES)
ADDRLP4 0
INDIRI4
CNSTI4 5
NEI4 $855
line 1244
;1244:        j = MAX_ADMIN_NAMELOG_NAMES - 1;
ADDRLP4 0
CNSTI4 4
ASGNI4
LABELV $855
line 1245
;1245:      Q_strncpyz(g_admin_namelog[i]->name[j], client->pers.netname, sizeof(g_admin_namelog[i]->name[j]));
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1246
;1246:      g_admin_namelog[i]->slot = (disconnect) ? -1 : clientNum;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $858
ADDRLP4 100
CNSTI4 -1
ASGNI4
ADDRGP4 $859
JUMPV
LABELV $858
ADDRLP4 100
ADDRLP4 72
INDIRI4
ASGNI4
LABELV $859
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 100
INDIRI4
ASGNI4
line 1249
;1247:
;1248:      // if this player is connecting, they are no longer banned
;1249:      if (!disconnect)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $837
line 1250
;1250:        g_admin_namelog[i]->banned = qfalse;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 0
ASGNI4
line 1252
;1251:
;1252:      return;
ADDRGP4 $837
JUMPV
LABELV $846
line 1254
;1253:    }
;1254:  }
LABELV $839
line 1225
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $841
ADDRLP4 4
INDIRI4
CNSTI4 128
GEI4 $862
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $838
LABELV $862
line 1255
;1255:  if (i >= MAX_ADMIN_NAMELOGS)
ADDRLP4 4
INDIRI4
CNSTI4 128
LTI4 $863
line 1256
;1256:  {
line 1257
;1257:    G_Printf("G_admin_namelog_update: warning, g_admin_namelogs overflow\n");
ADDRGP4 $865
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1258
;1258:    return;
ADDRGP4 $837
JUMPV
LABELV $863
line 1260
;1259:  }
;1260:  namelog = G_Alloc(sizeof(g_admin_namelog_t));
CNSTI4 220
ARGI4
ADDRLP4 84
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 76
ADDRLP4 84
INDIRP4
ASGNP4
line 1261
;1261:  memset(namelog, 0, sizeof(namelog));
ADDRLP4 76
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1262
;1262:  for(j = 0;j < MAX_ADMIN_NAMELOG_NAMES;j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $866
line 1263
;1263:    namelog->name[j][0] = '\0';
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 76
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $867
line 1262
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $866
line 1264
;1264:  Q_strncpyz(namelog->ip, client->pers.ip, sizeof(namelog->ip));
ADDRLP4 76
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 729
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1265
;1265:  Q_strncpyz(namelog->guid, client->pers.guid, sizeof(namelog->guid));
ADDRLP4 76
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1266
;1266:  Q_strncpyz(namelog->name[0], client->pers.netname, sizeof(namelog->name[0]));
ADDRLP4 76
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1267
;1267:  namelog->slot = (disconnect) ? -1 : clientNum;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $871
ADDRLP4 88
CNSTI4 -1
ASGNI4
ADDRGP4 $872
JUMPV
LABELV $871
ADDRLP4 88
ADDRLP4 72
INDIRI4
ASGNI4
LABELV $872
ADDRLP4 76
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 88
INDIRI4
ASGNI4
line 1268
;1268:  g_admin_namelog[i] = namelog;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
ADDRLP4 76
INDIRP4
ASGNP4
line 1269
;1269:}
LABELV $837
endproc G_admin_namelog_update 104 12
lit
align 1
LABELV $989
byte 1 0
skip 31
export G_admin_readconfig
code
proc G_admin_readconfig 144 20
line 1273
;1270:
;1271:qboolean
;1272:G_admin_readconfig(gentity_t *ent, int skiparg)
;1273:{
line 1274
;1274:  g_admin_level_t * l = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 1275
;1275:  g_admin_admin_t *a = NULL;
ADDRLP4 20
CNSTP4 0
ASGNP4
line 1276
;1276:  g_admin_ban_t *b = NULL;
ADDRLP4 28
CNSTP4 0
ASGNP4
line 1277
;1277:  g_admin_command_t *c = NULL;
ADDRLP4 48
CNSTP4 0
ASGNP4
line 1278
;1278:  int lc = 0, ac = 0, bc = 0, cc = 0;
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 60
CNSTI4 0
ASGNI4
line 1286
;1279:  fileHandle_t f;
;1280:  int len;
;1281:  char *cnf, *cnf2;
;1282:  char *t;
;1283:  qboolean level_open, admin_open, ban_open, command_open;
;1284:  int i;
;1285:
;1286:  G_admin_cleanup();
ADDRGP4 G_admin_cleanup
CALLV
pop
line 1288
;1287:
;1288:  if (!g_admin.string[0])
ADDRGP4 g_admin+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $874
line 1289
;1289:  {
line 1290
;1290:    ADMP("^3!readconfig: g_admin is not set, not loading configuration "
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $877
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1292
;1291:        "from a file\n");
;1292:    admin_default_levels();
ADDRGP4 admin_default_levels
CALLV
pop
line 1293
;1293:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $873
JUMPV
LABELV $874
line 1296
;1294:  }
;1295:
;1296:  len = trap_FS_FOpenFile(g_admin.string, &f, FS_READ);
ADDRGP4 g_admin+16
ARGP4
ADDRLP4 64
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 72
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 52
ADDRLP4 72
INDIRI4
ASGNI4
line 1297
;1297:  if (len < 0)
ADDRLP4 52
INDIRI4
CNSTI4 0
GEI4 $879
line 1298
;1298:  {
line 1299
;1299:    ADMP(va("^3!readconfig: ^7could not open admin config file %s\n",
ADDRGP4 $881
ARGP4
ADDRGP4 g_admin+16
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1301
;1300:            g_admin.string));
;1301:    admin_default_levels();
ADDRGP4 admin_default_levels
CALLV
pop
line 1302
;1302:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $873
JUMPV
LABELV $879
line 1304
;1303:  }
;1304:  cnf = G_Alloc(len + 1);
ADDRLP4 52
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 76
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 76
INDIRP4
ASGNP4
line 1305
;1305:  cnf2 = cnf;
ADDRLP4 68
ADDRLP4 16
INDIRP4
ASGNP4
line 1306
;1306:  trap_FS_Read(cnf, len, f);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 1307
;1307:  *(cnf + len) = '\0';
ADDRLP4 52
INDIRI4
ADDRLP4 16
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1308
;1308:  trap_FS_FCloseFile(f);
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 1310
;1309:
;1310:  t = COM_Parse(&cnf);
ADDRLP4 16
ARGP4
ADDRLP4 80
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRP4
ASGNP4
line 1311
;1311:  level_open = admin_open = ban_open = command_open = qfalse;
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 40
ADDRLP4 84
INDIRI4
ASGNI4
ADDRLP4 32
ADDRLP4 84
INDIRI4
ASGNI4
ADDRLP4 24
ADDRLP4 84
INDIRI4
ASGNI4
ADDRLP4 12
ADDRLP4 84
INDIRI4
ASGNI4
ADDRGP4 $884
JUMPV
LABELV $883
line 1313
;1312:  while(*t)
;1313:  {
line 1314
;1314:    if (!Q_stricmp(t, "[level]") || !Q_stricmp(t, "[admin]") || !Q_stricmp(t, "[ban]") || !Q_stricmp(t, "[command]"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $888
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $894
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $889
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $894
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $890
ARGP4
ADDRLP4 96
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $894
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $891
ARGP4
ADDRLP4 100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $886
LABELV $894
line 1315
;1315:    {
line 1317
;1316:
;1317:      if (level_open)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $895
line 1318
;1318:        g_admin_levels[lc++] = l;
ADDRLP4 104
ADDRLP4 36
INDIRI4
ASGNI4
ADDRLP4 36
ADDRLP4 104
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $896
JUMPV
LABELV $895
line 1319
;1319:      else if (admin_open)
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $897
line 1320
;1320:        g_admin_admins[ac++] = a;
ADDRLP4 108
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 44
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
ADDRGP4 $898
JUMPV
LABELV $897
line 1321
;1321:      else if (ban_open)
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $899
line 1322
;1322:        g_admin_bans[bc++] = b;
ADDRLP4 112
ADDRLP4 56
INDIRI4
ASGNI4
ADDRLP4 56
ADDRLP4 112
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
ADDRLP4 28
INDIRP4
ASGNP4
ADDRGP4 $900
JUMPV
LABELV $899
line 1323
;1323:      else if (command_open)
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $901
line 1324
;1324:        g_admin_commands[cc++] = c;
ADDRLP4 116
ADDRLP4 60
INDIRI4
ASGNI4
ADDRLP4 60
ADDRLP4 116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
ADDRLP4 48
INDIRP4
ASGNP4
LABELV $901
LABELV $900
LABELV $898
LABELV $896
line 1325
;1325:      level_open = admin_open = ban_open = command_open = qfalse;
ADDRLP4 120
CNSTI4 0
ASGNI4
ADDRLP4 40
ADDRLP4 120
INDIRI4
ASGNI4
ADDRLP4 32
ADDRLP4 120
INDIRI4
ASGNI4
ADDRLP4 24
ADDRLP4 120
INDIRI4
ASGNI4
ADDRLP4 12
ADDRLP4 120
INDIRI4
ASGNI4
line 1326
;1326:    }
LABELV $886
line 1328
;1327:
;1328:    if (level_open)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $903
line 1329
;1329:    {
line 1330
;1330:      if (!Q_stricmp(t, "level"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $907
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $905
line 1331
;1331:      {
line 1332
;1332:        admin_readconfig_int(&cnf, &l->level);
ADDRLP4 16
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 admin_readconfig_int
CALLV
pop
line 1333
;1333:      }
ADDRGP4 $904
JUMPV
LABELV $905
line 1334
;1334:      else if (!Q_stricmp(t, "name"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $785
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $908
line 1335
;1335:      {
line 1336
;1336:        admin_readconfig_string(&cnf, l->name, sizeof(l->name));
ADDRLP4 16
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 admin_readconfig_string
CALLV
pop
line 1337
;1337:      }
ADDRGP4 $904
JUMPV
LABELV $908
line 1338
;1338:      else if (!Q_stricmp(t, "flags"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $912
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $910
line 1339
;1339:      {
line 1340
;1340:        admin_readconfig_string(&cnf, l->flags, sizeof(l->flags));
ADDRLP4 16
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 admin_readconfig_string
CALLV
pop
line 1341
;1341:      }
ADDRGP4 $904
JUMPV
LABELV $910
line 1343
;1342:      else
;1343:      {
line 1344
;1344:        ADMP(va("^3!readconfig: ^7[level] parse error near %s on line %d\n", t,
ADDRLP4 116
ADDRGP4 COM_GetCurrentParseLine
CALLI4
ASGNI4
ADDRGP4 $913
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 120
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1346
;1345:                COM_GetCurrentParseLine()));
;1346:      }
line 1347
;1347:    }
ADDRGP4 $904
JUMPV
LABELV $903
line 1348
;1348:    else if (admin_open)
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $914
line 1349
;1349:    {
line 1350
;1350:      if (!Q_stricmp(t, "name"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $785
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $916
line 1351
;1351:      {
line 1352
;1352:        admin_readconfig_string(&cnf, a->name, sizeof(a->name));
ADDRLP4 16
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 33
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 admin_readconfig_string
CALLV
pop
line 1353
;1353:      }
ADDRGP4 $915
JUMPV
LABELV $916
line 1354
;1354:      else if (!Q_stricmp(t, "guid"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $920
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $918
line 1355
;1355:      {
line 1356
;1356:        admin_readconfig_string(&cnf, a->guid, sizeof(a->guid));
ADDRLP4 16
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 admin_readconfig_string
CALLV
pop
line 1357
;1357:      }
ADDRGP4 $915
JUMPV
LABELV $918
line 1358
;1358:      else if (!Q_stricmp(t, "level"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $907
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $921
line 1359
;1359:      {
line 1360
;1360:        admin_readconfig_int(&cnf, &a->level);
ADDRLP4 16
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 68
ADDP4
ARGP4
ADDRGP4 admin_readconfig_int
CALLV
pop
line 1361
;1361:      }
ADDRGP4 $915
JUMPV
LABELV $921
line 1362
;1362:      else if (!Q_stricmp(t, "flags"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $912
ARGP4
ADDRLP4 116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $923
line 1363
;1363:      {
line 1364
;1364:        admin_readconfig_string(&cnf, a->flags, sizeof(a->flags));
ADDRLP4 16
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 72
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 admin_readconfig_string
CALLV
pop
line 1365
;1365:      }
ADDRGP4 $915
JUMPV
LABELV $923
line 1367
;1366:      else
;1367:      {
line 1368
;1368:        ADMP(va("^3!readconfig: ^7[admin] parse error near %s on line %d\n", t,
ADDRLP4 120
ADDRGP4 COM_GetCurrentParseLine
CALLI4
ASGNI4
ADDRGP4 $925
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 120
INDIRI4
ARGI4
ADDRLP4 124
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1370
;1369:                COM_GetCurrentParseLine()));
;1370:      }
line 1372
;1371:
;1372:    }
ADDRGP4 $915
JUMPV
LABELV $914
line 1373
;1373:    else if (ban_open)
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $926
line 1374
;1374:    {
line 1375
;1375:      if (!Q_stricmp(t, "name"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $785
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $928
line 1376
;1376:      {
line 1377
;1377:        admin_readconfig_string(&cnf, b->name, sizeof(b->name));
ADDRLP4 16
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 admin_readconfig_string
CALLV
pop
line 1378
;1378:      }
ADDRGP4 $927
JUMPV
LABELV $928
line 1379
;1379:      else if (!Q_stricmp(t, "guid"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $920
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $930
line 1380
;1380:      {
line 1381
;1381:        admin_readconfig_string(&cnf, b->guid, sizeof(b->guid));
ADDRLP4 16
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 admin_readconfig_string
CALLV
pop
line 1382
;1382:      }
ADDRGP4 $927
JUMPV
LABELV $930
line 1383
;1383:      else if (!Q_stricmp(t, "ip"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $733
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $932
line 1384
;1384:      {
line 1385
;1385:        admin_readconfig_string(&cnf, b->ip, sizeof(b->ip));
ADDRLP4 16
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 65
ADDP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 admin_readconfig_string
CALLV
pop
line 1386
;1386:      }
ADDRGP4 $927
JUMPV
LABELV $932
line 1387
;1387:      else if (!Q_stricmp(t, "reason"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $936
ARGP4
ADDRLP4 116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $934
line 1388
;1388:      {
line 1389
;1389:        admin_readconfig_string(&cnf, b->reason, sizeof(b->reason));
ADDRLP4 16
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 85
ADDP4
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 admin_readconfig_string
CALLV
pop
line 1390
;1390:      }
ADDRGP4 $927
JUMPV
LABELV $934
line 1391
;1391:      else if (!Q_stricmp(t, "made"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $939
ARGP4
ADDRLP4 120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $937
line 1392
;1392:      {
line 1393
;1393:        admin_readconfig_string(&cnf, b->made, sizeof(b->made));
ADDRLP4 16
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 135
ADDP4
ARGP4
CNSTI4 18
ARGI4
ADDRGP4 admin_readconfig_string
CALLV
pop
line 1394
;1394:      }
ADDRGP4 $927
JUMPV
LABELV $937
line 1395
;1395:      else if (!Q_stricmp(t, "expires"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $942
ARGP4
ADDRLP4 124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
NEI4 $940
line 1396
;1396:      {
line 1397
;1397:        admin_readconfig_int(&cnf, &b->expires);
ADDRLP4 16
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRGP4 admin_readconfig_int
CALLV
pop
line 1398
;1398:      }
ADDRGP4 $927
JUMPV
LABELV $940
line 1399
;1399:      else if (!Q_stricmp(t, "banner"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $945
ARGP4
ADDRLP4 128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
NEI4 $943
line 1400
;1400:      {
line 1401
;1401:        admin_readconfig_string(&cnf, b->banner, sizeof(b->banner));
ADDRLP4 16
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 160
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 admin_readconfig_string
CALLV
pop
line 1402
;1402:      }
ADDRGP4 $927
JUMPV
LABELV $943
line 1404
;1403:      else
;1404:      {
line 1405
;1405:        ADMP(va("^3!readconfig: ^7[ban] parse error near %s on line %d\n", t,
ADDRLP4 132
ADDRGP4 COM_GetCurrentParseLine
CALLI4
ASGNI4
ADDRGP4 $946
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 132
INDIRI4
ARGI4
ADDRLP4 136
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1407
;1406:                COM_GetCurrentParseLine()));
;1407:      }
line 1408
;1408:    }
ADDRGP4 $927
JUMPV
LABELV $926
line 1409
;1409:    else if (command_open)
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $947
line 1410
;1410:    {
line 1411
;1411:      if (!Q_stricmp(t, "command"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $951
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $949
line 1412
;1412:      {
line 1413
;1413:        admin_readconfig_string(&cnf, c->command, sizeof(c->command));
ADDRLP4 16
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 admin_readconfig_string
CALLV
pop
line 1414
;1414:      }
ADDRGP4 $950
JUMPV
LABELV $949
line 1415
;1415:      else if (!Q_stricmp(t, "exec"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $954
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $952
line 1416
;1416:      {
line 1417
;1417:        admin_readconfig_string(&cnf, c->exec, sizeof(c->exec));
ADDRLP4 16
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 admin_readconfig_string
CALLV
pop
line 1418
;1418:      }
ADDRGP4 $953
JUMPV
LABELV $952
line 1419
;1419:      else if (!Q_stricmp(t, "desc"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $957
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $955
line 1420
;1420:      {
line 1421
;1421:        admin_readconfig_string(&cnf, c->desc, sizeof(c->desc));
ADDRLP4 16
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 84
ADDP4
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 admin_readconfig_string
CALLV
pop
line 1422
;1422:      }
ADDRGP4 $956
JUMPV
LABELV $955
line 1423
;1423:      else if (!Q_stricmp(t, "flag"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $960
ARGP4
ADDRLP4 116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $958
line 1424
;1424:      {
line 1425
;1425:        admin_readconfig_string(&cnf, c->flag, sizeof(c->flag));
ADDRLP4 16
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 134
ADDP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 admin_readconfig_string
CALLV
pop
line 1426
;1426:      }
ADDRGP4 $959
JUMPV
LABELV $958
line 1428
;1427:      else
;1428:      {
line 1429
;1429:        ADMP(va("^3!readconfig: ^7[command] parse error near %s on line %d\n",
ADDRLP4 120
ADDRGP4 COM_GetCurrentParseLine
CALLI4
ASGNI4
ADDRGP4 $961
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 120
INDIRI4
ARGI4
ADDRLP4 124
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1431
;1430:                t, COM_GetCurrentParseLine()));
;1431:      }
LABELV $959
LABELV $956
LABELV $953
LABELV $950
line 1432
;1432:    }
LABELV $947
LABELV $927
LABELV $915
LABELV $904
line 1434
;1433:
;1434:    if (!Q_stricmp(t, "[level]"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $888
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $962
line 1435
;1435:    {
line 1436
;1436:      if (lc >= MAX_ADMIN_LEVELS)
ADDRLP4 36
INDIRI4
CNSTI4 32
LTI4 $964
line 1437
;1437:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $873
JUMPV
LABELV $964
line 1438
;1438:      l = G_Alloc(sizeof(g_admin_level_t));
CNSTI4 1060
ARGI4
ADDRLP4 108
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 108
INDIRP4
ASGNP4
line 1439
;1439:      l->level = 0;
ADDRLP4 8
INDIRP4
CNSTI4 0
ASGNI4
line 1440
;1440:      *l->name = '\0';
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTI1 0
ASGNI1
line 1441
;1441:      *l->flags = '\0';
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
CNSTI1 0
ASGNI1
line 1442
;1442:      level_open = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 1443
;1443:    }
ADDRGP4 $963
JUMPV
LABELV $962
line 1444
;1444:    else if (!Q_stricmp(t, "[admin]"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $889
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $966
line 1445
;1445:    {
line 1446
;1446:      if (ac >= MAX_ADMIN_ADMINS)
ADDRLP4 44
INDIRI4
CNSTI4 1024
LTI4 $968
line 1447
;1447:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $873
JUMPV
LABELV $968
line 1448
;1448:      a = G_Alloc(sizeof(g_admin_admin_t));
CNSTI4 1096
ARGI4
ADDRLP4 112
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 112
INDIRP4
ASGNP4
line 1449
;1449:      *a->name = '\0';
ADDRLP4 20
INDIRP4
CNSTI4 33
ADDP4
CNSTI1 0
ASGNI1
line 1450
;1450:      *a->guid = '\0';
ADDRLP4 20
INDIRP4
CNSTI1 0
ASGNI1
line 1451
;1451:      a->level = 0;
ADDRLP4 20
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 0
ASGNI4
line 1452
;1452:      *a->flags = '\0';
ADDRLP4 20
INDIRP4
CNSTI4 72
ADDP4
CNSTI1 0
ASGNI1
line 1453
;1453:      admin_open = qtrue;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 1454
;1454:    }
ADDRGP4 $967
JUMPV
LABELV $966
line 1455
;1455:    else if (!Q_stricmp(t, "[ban]"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $890
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $970
line 1456
;1456:    {
line 1457
;1457:      if (bc >= MAX_ADMIN_BANS)
ADDRLP4 56
INDIRI4
CNSTI4 1024
LTI4 $972
line 1458
;1458:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $873
JUMPV
LABELV $972
line 1459
;1459:      b = G_Alloc(sizeof(g_admin_ban_t));
CNSTI4 192
ARGI4
ADDRLP4 116
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 116
INDIRP4
ASGNP4
line 1460
;1460:      *b->name = '\0';
ADDRLP4 28
INDIRP4
CNSTI1 0
ASGNI1
line 1461
;1461:      *b->guid = '\0';
ADDRLP4 28
INDIRP4
CNSTI4 32
ADDP4
CNSTI1 0
ASGNI1
line 1462
;1462:      *b->ip = '\0';
ADDRLP4 28
INDIRP4
CNSTI4 65
ADDP4
CNSTI1 0
ASGNI1
line 1463
;1463:      *b->made = '\0';
ADDRLP4 28
INDIRP4
CNSTI4 135
ADDP4
CNSTI1 0
ASGNI1
line 1464
;1464:      b->expires = 0;
ADDRLP4 28
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 1465
;1465:      *b->reason = '\0';
ADDRLP4 28
INDIRP4
CNSTI4 85
ADDP4
CNSTI1 0
ASGNI1
line 1466
;1466:      ban_open = qtrue;
ADDRLP4 32
CNSTI4 1
ASGNI4
line 1467
;1467:    }
ADDRGP4 $971
JUMPV
LABELV $970
line 1468
;1468:    else if (!Q_stricmp(t, "[command]"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $891
ARGP4
ADDRLP4 116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $974
line 1469
;1469:    {
line 1470
;1470:      if (cc >= MAX_ADMIN_COMMANDS)
ADDRLP4 60
INDIRI4
CNSTI4 64
LTI4 $976
line 1471
;1471:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $873
JUMPV
LABELV $976
line 1472
;1472:      c = G_Alloc(sizeof(g_admin_command_t));
CNSTI4 156
ARGI4
ADDRLP4 120
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 120
INDIRP4
ASGNP4
line 1473
;1473:      *c->command = '\0';
ADDRLP4 48
INDIRP4
CNSTI1 0
ASGNI1
line 1474
;1474:      *c->exec = '\0';
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
CNSTI1 0
ASGNI1
line 1475
;1475:      *c->desc = '\0';
ADDRLP4 48
INDIRP4
CNSTI4 84
ADDP4
CNSTI1 0
ASGNI1
line 1476
;1476:      *c->flag = '\0';
ADDRLP4 48
INDIRP4
CNSTI4 134
ADDP4
CNSTI1 0
ASGNI1
line 1477
;1477:      command_open = qtrue;
ADDRLP4 40
CNSTI4 1
ASGNI4
line 1478
;1478:    }
LABELV $974
LABELV $971
LABELV $967
LABELV $963
line 1479
;1479:    t = COM_Parse(&cnf);
ADDRLP4 16
ARGP4
ADDRLP4 120
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 120
INDIRP4
ASGNP4
line 1480
;1480:  }
LABELV $884
line 1312
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $883
line 1481
;1481:  if (level_open)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $978
line 1482
;1482:  {
line 1484
;1483:
;1484:    g_admin_levels[lc++] = l;
ADDRLP4 88
ADDRLP4 36
INDIRI4
ASGNI4
ADDRLP4 36
ADDRLP4 88
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
line 1485
;1485:  }
LABELV $978
line 1486
;1486:  if (admin_open)
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $980
line 1487
;1487:    g_admin_admins[ac++] = a;
ADDRLP4 88
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 44
ADDRLP4 88
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
ADDRLP4 20
INDIRP4
ASGNP4
LABELV $980
line 1488
;1488:  if (ban_open)
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $982
line 1489
;1489:    g_admin_bans[bc++] = b;
ADDRLP4 92
ADDRLP4 56
INDIRI4
ASGNI4
ADDRLP4 56
ADDRLP4 92
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
ADDRLP4 28
INDIRP4
ASGNP4
LABELV $982
line 1490
;1490:  if (command_open)
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $984
line 1491
;1491:    g_admin_commands[cc++] = c;
ADDRLP4 96
ADDRLP4 60
INDIRI4
ASGNI4
ADDRLP4 60
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
ADDRLP4 48
INDIRP4
ASGNP4
LABELV $984
line 1492
;1492:  G_Free(cnf2);
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 G_Free
CALLV
pop
line 1493
;1493:  ADMP(va(
ADDRGP4 $986
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1496
;1494:          "^3!readconfig: ^7loaded %d levels, %d admins, %d bans, %d commands\n",
;1495:          lc, ac, bc, cc));
;1496:  if (lc == 0)
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $987
line 1497
;1497:    admin_default_levels();
ADDRGP4 admin_default_levels
CALLV
pop
ADDRGP4 $988
JUMPV
LABELV $987
line 1499
;1498:  else
;1499:  {
line 1501
;1500:    char n[MAX_NAME_LENGTH] =
;1501:    { "" };
ADDRLP4 104
ADDRGP4 $989
INDIRB
ASGNB 32
line 1504
;1502:
;1503:    // max printable name length for formatting
;1504:    for(i = 0;i < MAX_ADMIN_LEVELS && g_admin_levels[i];i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $993
JUMPV
LABELV $990
line 1505
;1505:    {
line 1506
;1506:      G_DecolorString(l->name, n);
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 104
ARGP4
ADDRGP4 G_DecolorString
CALLV
pop
line 1507
;1507:      if (strlen(n) > admin_level_maxname)
ADDRLP4 104
ARGP4
ADDRLP4 136
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
ADDRGP4 admin_level_maxname
INDIRI4
LEI4 $994
line 1508
;1508:        admin_level_maxname = strlen(n);
ADDRLP4 104
ARGP4
ADDRLP4 140
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 admin_level_maxname
ADDRLP4 140
INDIRI4
ASGNI4
LABELV $994
line 1509
;1509:    }
LABELV $991
line 1504
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $993
ADDRLP4 4
INDIRI4
CNSTI4 32
GEI4 $996
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $990
LABELV $996
line 1510
;1510:  }
LABELV $988
line 1512
;1511:  // reset adminLevel
;1512:  for(i = 0;i < level.maxclients;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1000
JUMPV
LABELV $997
line 1513
;1513:    if (level.clients[i].pers.connected != CON_DISCONNECTED)
CNSTI4 2148
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1002
line 1514
;1514:      level.clients[i].pers.adminLevel = G_admin_level(&g_entities[i]);
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 108
ADDRGP4 G_admin_level
CALLI4
ASGNI4
CNSTI4 2148
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1000
ADDP4
ADDRLP4 108
INDIRI4
ASGNI4
LABELV $1002
LABELV $998
line 1512
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1000
ADDRLP4 4
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $997
line 1515
;1515:  return qtrue;
CNSTI4 1
RETI4
LABELV $873
endproc G_admin_readconfig 144 20
export G_admin_time
proc G_admin_time 48 16
line 1520
;1516:}
;1517:
;1518:qboolean
;1519:G_admin_time(gentity_t *ent, int skiparg)
;1520:{
line 1524
;1521:  qtime_t qt;
;1522:  int t;
;1523:
;1524:  t = trap_RealTime(&qt);
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 trap_RealTime
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 40
INDIRI4
ASGNI4
line 1525
;1525:  ADMP(va("^3!time: ^7local time is %02i:%02i:%02i\n", qt.tm_hour, qt.tm_min,
ADDRGP4 $1005
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1527
;1526:          qt.tm_sec));
;1527:  return qtrue;
CNSTI4 1
RETI4
LABELV $1004
endproc G_admin_time 48 16
lit
align 1
LABELV $1009
byte 1 0
skip 31
align 1
LABELV $1010
byte 1 0
skip 31
align 1
LABELV $1011
byte 1 0
skip 31
export G_admin_setlevel
code
proc G_admin_setlevel 260 16
line 1532
;1528:}
;1529:
;1530:qboolean
;1531:G_admin_setlevel(gentity_t *ent, int skiparg)
;1532:{
line 1534
;1533:  char name[MAX_NAME_LENGTH] =
;1534:  { "" };
ADDRLP4 4
ADDRGP4 $1009
INDIRB
ASGNB 32
line 1537
;1535:  char lstr[11]; // 10 is max strlen() for 32-bit int
;1536:  char adminname[MAX_NAME_LENGTH] =
;1537:  { "" };
ADDRLP4 112
ADDRGP4 $1010
INDIRB
ASGNB 32
line 1539
;1538:  char testname[MAX_NAME_LENGTH] =
;1539:  { "" };
ADDRLP4 69
ADDRGP4 $1011
INDIRB
ASGNB 32
line 1542
;1540:  char guid[33];
;1541:  int l, i;
;1542:  gentity_t *vic = NULL;
ADDRLP4 144
CNSTP4 0
ASGNP4
line 1543
;1543:  qboolean updated = qfalse;
ADDRLP4 152
CNSTI4 0
ASGNI4
line 1545
;1544:  g_admin_admin_t *a;
;1545:  qboolean found = qfalse;
ADDRLP4 156
CNSTI4 0
ASGNI4
line 1546
;1546:  qboolean numeric = qtrue;
ADDRLP4 148
CNSTI4 1
ASGNI4
line 1547
;1547:  int matches = 0;
ADDRLP4 108
CNSTI4 0
ASGNI4
line 1548
;1548:  int id = -1;
ADDRLP4 160
CNSTI4 -1
ASGNI4
line 1550
;1549:
;1550:  if (G_SayArgc() < 3 + skiparg)
ADDRLP4 180
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
GEI4 $1012
line 1551
;1551:  {
line 1552
;1552:    ADMP("^3!setlevel: ^7usage: !setlevel [name|slot#] [level]\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1014
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1553
;1553:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1008
JUMPV
LABELV $1012
line 1555
;1554:  }
;1555:  G_SayArgv(1 + skiparg, testname, sizeof(testname));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 69
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 1556
;1556:  G_SayArgv(2 + skiparg, lstr, sizeof(lstr));
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 168
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 1557
;1557:  l = atoi(lstr);
ADDRLP4 168
ARGP4
ADDRLP4 184
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 104
ADDRLP4 184
INDIRI4
ASGNI4
line 1558
;1558:  G_SanitiseString(testname, name, sizeof(name));
ADDRLP4 69
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 1559
;1559:  for(i = 0;i < sizeof(name) && name[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1018
JUMPV
LABELV $1015
line 1560
;1560:  {
line 1561
;1561:    if (name[i] < '0' || name[i] > '9')
ADDRLP4 188
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 48
LTI4 $1021
ADDRLP4 188
INDIRI4
CNSTI4 57
LEI4 $1019
LABELV $1021
line 1562
;1562:    {
line 1563
;1563:      numeric = qfalse;
ADDRLP4 148
CNSTI4 0
ASGNI4
line 1564
;1564:      break;
ADDRGP4 $1017
JUMPV
LABELV $1019
line 1566
;1565:    }
;1566:  }
LABELV $1016
line 1559
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1018
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 32
GEU4 $1022
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1015
LABELV $1022
LABELV $1017
line 1567
;1567:  if (numeric)
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $1023
line 1568
;1568:    id = atoi(name);
ADDRLP4 4
ARGP4
ADDRLP4 192
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 160
ADDRLP4 192
INDIRI4
ASGNI4
LABELV $1023
line 1570
;1569:
;1570:  if (ent && l > ent->client->pers.adminLevel)
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1025
ADDRLP4 104
INDIRI4
ADDRLP4 196
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
LEI4 $1025
line 1571
;1571:  {
line 1572
;1572:    ADMP("^3!setlevel: ^7you may not use !setlevel to set a level higher "
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1027
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1574
;1573:        "than your current level\n");
;1574:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1008
JUMPV
LABELV $1025
line 1579
;1575:  }
;1576:
;1577:  // if admin is activated for the first time on a running server, we need
;1578:  // to ensure at least the default levels get created
;1579:  if (!ent && !g_admin_levels[0])
ADDRLP4 200
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 200
INDIRU4
NEU4 $1028
ADDRGP4 g_admin_levels
INDIRP4
CVPU4 4
ADDRLP4 200
INDIRU4
NEU4 $1028
line 1580
;1580:    G_admin_readconfig(NULL, 0);
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_admin_readconfig
CALLI4
pop
LABELV $1028
line 1582
;1581:
;1582:  for(i = 0;i < MAX_ADMIN_LEVELS && g_admin_levels[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1033
JUMPV
LABELV $1030
line 1583
;1583:  {
line 1584
;1584:    if (g_admin_levels[i]->level == l)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
INDIRI4
ADDRLP4 104
INDIRI4
NEI4 $1034
line 1585
;1585:    {
line 1586
;1586:      found = qtrue;
ADDRLP4 156
CNSTI4 1
ASGNI4
line 1587
;1587:      break;
ADDRGP4 $1032
JUMPV
LABELV $1034
line 1589
;1588:    }
;1589:  }
LABELV $1031
line 1582
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1033
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $1036
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1030
LABELV $1036
LABELV $1032
line 1590
;1590:  if (!found)
ADDRLP4 156
INDIRI4
CNSTI4 0
NEI4 $1037
line 1591
;1591:  {
line 1592
;1592:    ADMP("^3!setlevel: ^7level is not defined\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1039
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1593
;1593:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1008
JUMPV
LABELV $1037
line 1596
;1594:  }
;1595:
;1596:  if (numeric && id >= 0 && id < level.maxclients)
ADDRLP4 208
CNSTI4 0
ASGNI4
ADDRLP4 148
INDIRI4
ADDRLP4 208
INDIRI4
EQI4 $1040
ADDRLP4 160
INDIRI4
ADDRLP4 208
INDIRI4
LTI4 $1040
ADDRLP4 160
INDIRI4
ADDRGP4 level+20
INDIRI4
GEI4 $1040
line 1597
;1597:    vic = &g_entities[id];
ADDRLP4 144
CNSTI4 2476
ADDRLP4 160
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
LABELV $1040
line 1599
;1598:
;1599:  if (vic && vic->client && vic->client->pers.connected != CON_DISCONNECTED)
ADDRLP4 220
CNSTU4 0
ASGNU4
ADDRLP4 144
INDIRP4
CVPU4 4
ADDRLP4 220
INDIRU4
EQU4 $1043
ADDRLP4 224
ADDRLP4 144
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 224
INDIRP4
CVPU4 4
ADDRLP4 220
INDIRU4
EQU4 $1043
ADDRLP4 224
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1043
line 1600
;1600:  {
line 1601
;1601:    vic = &g_entities[id];
ADDRLP4 144
CNSTI4 2476
ADDRLP4 160
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1602
;1602:    Q_strncpyz(adminname, vic->client->pers.netname, sizeof(adminname));
ADDRLP4 112
ARGP4
ADDRLP4 228
CNSTI4 516
ASGNI4
ADDRLP4 144
INDIRP4
ADDRLP4 228
INDIRI4
ADDP4
INDIRP4
ADDRLP4 228
INDIRI4
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1603
;1603:    Q_strncpyz(guid, vic->client->pers.guid, sizeof(guid));
ADDRLP4 36
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1604
;1604:    matches = 1;
ADDRLP4 108
CNSTI4 1
ASGNI4
line 1605
;1605:  }
ADDRGP4 $1044
JUMPV
LABELV $1043
line 1606
;1606:  else if (numeric && id >= MAX_CLIENTS && id < MAX_CLIENTS + MAX_ADMIN_ADMINS && g_admin_admins[id - MAX_CLIENTS])
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $1045
ADDRLP4 160
INDIRI4
CNSTI4 64
LTI4 $1045
ADDRLP4 160
INDIRI4
CNSTI4 1088
GEI4 $1045
ADDRLP4 160
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins-256
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1045
line 1607
;1607:  {
line 1608
;1608:    Q_strncpyz(adminname, g_admin_admins[id - MAX_CLIENTS]->name, sizeof(adminname));
ADDRLP4 112
ARGP4
ADDRLP4 160
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins-256
ADDP4
INDIRP4
CNSTI4 33
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1609
;1609:    Q_strncpyz(guid, g_admin_admins[id - MAX_CLIENTS]->guid, sizeof(guid));
ADDRLP4 36
ARGP4
ADDRLP4 160
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins-256
ADDP4
INDIRP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1610
;1610:    matches = 1;
ADDRLP4 108
CNSTI4 1
ASGNI4
line 1611
;1611:  }
ADDRGP4 $1046
JUMPV
LABELV $1045
line 1613
;1612:  else
;1613:  {
line 1614
;1614:    for(i = 0;i < MAX_ADMIN_ADMINS && g_admin_admins[i] && matches < 2;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1053
JUMPV
LABELV $1050
line 1615
;1615:    {
line 1616
;1616:      G_SanitiseString(g_admin_admins[i]->name, testname, sizeof(testname));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 33
ADDP4
ARGP4
ADDRLP4 69
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 1617
;1617:      if (strstr(testname, name))
ADDRLP4 69
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 232
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 232
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1054
line 1618
;1618:      {
line 1619
;1619:        Q_strncpyz(adminname, g_admin_admins[i]->name, sizeof(adminname));
ADDRLP4 112
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 33
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1620
;1620:        Q_strncpyz(guid, g_admin_admins[i]->guid, sizeof(guid));
ADDRLP4 36
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1621
;1621:        matches++;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1622
;1622:      }
LABELV $1054
line 1623
;1623:    }
LABELV $1051
line 1614
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1053
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $1057
ADDRLP4 236
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 236
INDIRI4
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1057
ADDRLP4 108
INDIRI4
ADDRLP4 236
INDIRI4
LTI4 $1050
LABELV $1057
line 1624
;1624:    for(i = 0;i < level.maxclients && matches < 2;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1061
JUMPV
LABELV $1058
line 1625
;1625:    {
line 1626
;1626:      if (level.clients[i].pers.connected == CON_DISCONNECTED)
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1063
line 1627
;1627:        continue;
ADDRGP4 $1059
JUMPV
LABELV $1063
line 1628
;1628:      if (matches && !Q_stricmp(level.clients[i].pers.guid, guid))
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $1065
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 240
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 240
INDIRI4
CNSTI4 0
NEI4 $1065
line 1629
;1629:      {
line 1630
;1630:        vic = &g_entities[i];
ADDRLP4 144
CNSTI4 2476
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1631
;1631:        continue;
ADDRGP4 $1059
JUMPV
LABELV $1065
line 1633
;1632:      }
;1633:      G_SanitiseString(level.clients[i].pers.netname, testname, sizeof(testname));
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 69
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 1634
;1634:      if (strstr(testname, name))
ADDRLP4 69
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 244
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 244
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1067
line 1635
;1635:      {
line 1636
;1636:        vic = &g_entities[i];
ADDRLP4 144
CNSTI4 2476
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1637
;1637:        matches++;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1638
;1638:        Q_strncpyz(guid, vic->client->pers.guid, sizeof(guid));
ADDRLP4 36
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1639
;1639:      }
LABELV $1067
line 1640
;1640:    }
LABELV $1059
line 1624
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1061
ADDRLP4 0
INDIRI4
ADDRGP4 level+20
INDIRI4
GEI4 $1069
ADDRLP4 108
INDIRI4
CNSTI4 2
LTI4 $1058
LABELV $1069
line 1641
;1641:    if (vic)
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1070
line 1642
;1642:      Q_strncpyz(adminname, vic->client->pers.netname, sizeof(adminname));
ADDRLP4 112
ARGP4
ADDRLP4 240
CNSTI4 516
ASGNI4
ADDRLP4 144
INDIRP4
ADDRLP4 240
INDIRI4
ADDP4
INDIRP4
ADDRLP4 240
INDIRI4
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $1070
line 1643
;1643:  }
LABELV $1046
LABELV $1044
line 1645
;1644:
;1645:  if (matches == 0)
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $1072
line 1646
;1646:  {
line 1647
;1647:    ADMP("^3!setlevel:^7 no match.  use !listplayers or !listadmins to "
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1074
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1649
;1648:        "find an appropriate number to use instead of name.\n");
;1649:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1008
JUMPV
LABELV $1072
line 1651
;1650:  }
;1651:  else if (matches > 1)
ADDRLP4 108
INDIRI4
CNSTI4 1
LEI4 $1075
line 1652
;1652:  {
line 1653
;1653:    ADMP("^3!setlevel:^7 more than one match.  Use the admin number "
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1077
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1655
;1654:        "instead:\n");
;1655:    admin_listadmins(ent, 0, name, 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 232
CNSTI4 0
ASGNI4
ADDRLP4 232
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 232
INDIRI4
ARGI4
ADDRGP4 admin_listadmins
CALLI4
pop
line 1656
;1656:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1008
JUMPV
LABELV $1075
line 1659
;1657:  }
;1658:
;1659:  if (!Q_stricmp(guid, "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"))
ADDRLP4 36
ARGP4
ADDRGP4 $599
ARGP4
ADDRLP4 232
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 0
NEI4 $1078
line 1660
;1660:  {
line 1661
;1661:    ADMP(va("^3!setlevel: ^7%s does not have a valid GUID\n", adminname));
ADDRGP4 $1080
ARGP4
ADDRLP4 112
ARGP4
ADDRLP4 236
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 236
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1662
;1662:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1008
JUMPV
LABELV $1078
line 1664
;1663:  }
;1664:  if (ent && !admin_higher_guid(ent->client->pers.guid, guid))
ADDRLP4 236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 236
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1081
ADDRLP4 236
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 240
ADDRGP4 admin_higher_guid
CALLI4
ASGNI4
ADDRLP4 240
INDIRI4
CNSTI4 0
NEI4 $1081
line 1665
;1665:  {
line 1666
;1666:    ADMP("^3!setlevel: ^7sorry, but your intended victim has a higher"
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1083
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1668
;1667:        " admin level than you\n");
;1668:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1008
JUMPV
LABELV $1081
line 1671
;1669:  }
;1670:
;1671:  for(i = 0;i < MAX_ADMIN_ADMINS && g_admin_admins[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1087
JUMPV
LABELV $1084
line 1672
;1672:  {
line 1673
;1673:    if (!Q_stricmp(g_admin_admins[i]->guid, guid))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 244
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 244
INDIRI4
CNSTI4 0
NEI4 $1088
line 1674
;1674:    {
line 1675
;1675:      g_admin_admins[i]->level = l;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 1676
;1676:      Q_strncpyz(g_admin_admins[i]->name, adminname, sizeof(g_admin_admins[i]->name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 33
ADDP4
ARGP4
ADDRLP4 112
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1677
;1677:      updated = qtrue;
ADDRLP4 152
CNSTI4 1
ASGNI4
line 1678
;1678:    }
LABELV $1088
line 1679
;1679:  }
LABELV $1085
line 1671
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1087
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $1090
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1084
LABELV $1090
line 1680
;1680:  if (!updated)
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $1091
line 1681
;1681:  {
line 1682
;1682:    if (i == MAX_ADMIN_ADMINS)
ADDRLP4 0
INDIRI4
CNSTI4 1024
NEI4 $1093
line 1683
;1683:    {
line 1684
;1684:      ADMP("^3!setlevel: ^7too many admins\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1095
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1685
;1685:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1008
JUMPV
LABELV $1093
line 1687
;1686:    }
;1687:    a = G_Alloc(sizeof(g_admin_admin_t));
CNSTI4 1096
ARGI4
ADDRLP4 248
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 164
ADDRLP4 248
INDIRP4
ASGNP4
line 1688
;1688:    a->level = l;
ADDRLP4 164
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 1689
;1689:    Q_strncpyz(a->name, adminname, sizeof(a->name));
ADDRLP4 164
INDIRP4
CNSTI4 33
ADDP4
ARGP4
ADDRLP4 112
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1690
;1690:    Q_strncpyz(a->guid, guid, sizeof(a->guid));
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1691
;1691:    *a->flags = '\0';
ADDRLP4 164
INDIRP4
CNSTI4 72
ADDP4
CNSTI1 0
ASGNI1
line 1692
;1692:    g_admin_admins[i] = a;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
ADDRLP4 164
INDIRP4
ASGNP4
line 1693
;1693:  }
LABELV $1091
line 1695
;1694:
;1695:  AP(va(
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1098
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 252
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 248
ADDRLP4 252
INDIRP4
ASGNP4
ADDRGP4 $1099
JUMPV
LABELV $1098
ADDRLP4 248
ADDRGP4 $342
ASGNP4
LABELV $1099
ADDRGP4 $1096
ARGP4
ADDRLP4 112
ARGP4
ADDRLP4 104
INDIRI4
ARGI4
ADDRLP4 248
INDIRP4
ARGP4
ADDRLP4 256
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1698
;1696:          "print \"^3!setlevel: ^7%s^7 was given level %d admin rights by %s\n\"",
;1697:          adminname, l, (ent) ? G_admin_adminPrintName(ent) : "console"));
;1698:  if (vic)
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1100
line 1699
;1699:  {
line 1700
;1700:    vic->client->pers.adminLevel = l;
ADDRLP4 144
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 1701
;1701:    G_admin_set_adminname(vic);
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 G_admin_set_adminname
CALLV
pop
line 1702
;1702:  }
LABELV $1100
line 1704
;1703:
;1704:  if (!g_admin.string[0])
ADDRGP4 g_admin+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1102
line 1705
;1705:    ADMP(
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1105
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
ADDRGP4 $1103
JUMPV
LABELV $1102
line 1709
;1706:        "^3!setlevel: ^7WARNING g_admin not set, not saving admin record "
;1707:        "to a file\n");
;1708:  else
;1709:    admin_writeconfig();
ADDRGP4 admin_writeconfig
CALLV
pop
LABELV $1103
line 1710
;1710:  return qtrue;
CNSTI4 1
RETI4
LABELV $1008
endproc G_admin_setlevel 260 16
export G_admin_parse_time
proc G_admin_parse_time 52 0
line 1715
;1711:}
;1712:
;1713:int
;1714:G_admin_parse_time(const char *time)
;1715:{
line 1716
;1716:  int seconds = 0, num = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1718
;1717:  int i;
;1718:  for(i = 0;time[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1110
JUMPV
LABELV $1107
line 1719
;1719:  {
line 1720
;1720:    if (isdigit(time[i]))
ADDRLP4 12
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 48
LTI4 $1111
ADDRLP4 12
INDIRI4
CNSTI4 57
GTI4 $1111
line 1721
;1721:    {
line 1722
;1722:      num = num * 10 + time[i] - '0';
ADDRLP4 4
CNSTI4 10
ADDRLP4 4
INDIRI4
MULI4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDI4
CNSTI4 48
SUBI4
ASGNI4
line 1723
;1723:      continue;
ADDRGP4 $1108
JUMPV
LABELV $1111
line 1725
;1724:    }
;1725:    if (i == 0 || !isdigit(time[i - 1]))
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1116
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 48
LTI4 $1116
ADDRLP4 20
INDIRI4
CNSTI4 57
LEI4 $1113
LABELV $1116
line 1726
;1726:      return -1;
CNSTI4 -1
RETI4
ADDRGP4 $1106
JUMPV
LABELV $1113
line 1727
;1727:    switch(time[i])
ADDRLP4 24
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
CNSTI4 109
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $1123
ADDRLP4 24
INDIRI4
ADDRLP4 32
INDIRI4
GTI4 $1126
LABELV $1125
ADDRLP4 40
CNSTI4 100
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $1121
ADDRLP4 24
INDIRI4
ADDRLP4 40
INDIRI4
LTI4 $1117
LABELV $1127
ADDRLP4 24
INDIRI4
CNSTI4 104
EQI4 $1122
ADDRGP4 $1117
JUMPV
LABELV $1126
ADDRLP4 48
CNSTI4 115
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $1118
ADDRLP4 24
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $1117
LABELV $1128
ADDRLP4 24
INDIRI4
CNSTI4 119
EQI4 $1120
ADDRGP4 $1117
JUMPV
line 1728
;1728:    {
LABELV $1120
line 1730
;1729:      case 'w':
;1730:        num *= 7;
ADDRLP4 4
CNSTI4 7
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
LABELV $1121
line 1732
;1731:      case 'd':
;1732:        num *= 24;
ADDRLP4 4
CNSTI4 24
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
LABELV $1122
line 1734
;1733:      case 'h':
;1734:        num *= 60;
ADDRLP4 4
CNSTI4 60
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
LABELV $1123
line 1736
;1735:      case 'm':
;1736:        num *= 60;
ADDRLP4 4
CNSTI4 60
ADDRLP4 4
INDIRI4
MULI4
ASGNI4
line 1738
;1737:      case 's':
;1738:        break;
ADDRGP4 $1118
JUMPV
LABELV $1117
line 1740
;1739:      default:
;1740:        return -1;
CNSTI4 -1
RETI4
ADDRGP4 $1106
JUMPV
LABELV $1118
line 1742
;1741:    }
;1742:    seconds += num;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1743
;1743:    num = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1744
;1744:  }
LABELV $1108
line 1718
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1110
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1107
line 1745
;1745:  if (num)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1129
line 1746
;1746:    seconds += num;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
LABELV $1129
line 1748
;1747:  // overflow
;1748:  if (seconds < 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
GEI4 $1131
line 1749
;1749:    seconds = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $1131
line 1750
;1750:  return seconds;
ADDRLP4 8
INDIRI4
RETI4
LABELV $1106
endproc G_admin_parse_time 52 0
proc admin_create_ban 68 28
line 1755
;1751:}
;1752:
;1753:static qboolean
;1754:admin_create_ban(gentity_t *ent, char *netname, char *guid, char *ip, int seconds, char *reason)
;1755:{
line 1756
;1756:  g_admin_ban_t *b = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 1761
;1757:  qtime_t qt;
;1758:  int t;
;1759:  int i;
;1760:
;1761:  t = trap_RealTime(&qt);
ADDRLP4 8
ARGP4
ADDRLP4 48
ADDRGP4 trap_RealTime
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 48
INDIRI4
ASGNI4
line 1762
;1762:  b = G_Alloc(sizeof(g_admin_ban_t));
CNSTI4 192
ARGI4
ADDRLP4 52
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 52
INDIRP4
ASGNP4
line 1764
;1763:
;1764:  if (!b)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1134
line 1765
;1765:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1133
JUMPV
LABELV $1134
line 1767
;1766:
;1767:  Q_strncpyz(b->name, netname, sizeof(b->name));
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1768
;1768:  Q_strncpyz(b->guid, guid, sizeof(b->guid));
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1769
;1769:  Q_strncpyz(b->ip, ip, sizeof(b->ip));
ADDRLP4 4
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1772
;1770:
;1771:  //strftime( b->made, sizeof( b->made ), "%m/%d/%y %H:%M:%S", lt );
;1772:  Q_strncpyz(b->made, va("%02i/%02i/%02i %02i:%02i:%02i", (qt.tm_mon + 1), qt.tm_mday, (qt.tm_year - 100), qt.tm_hour, qt.tm_min, qt.tm_sec), sizeof(b->made));
ADDRGP4 $1136
ARGP4
ADDRLP4 8+16
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 8+12
INDIRI4
ARGI4
ADDRLP4 8+20
INDIRI4
CNSTI4 100
SUBI4
ARGI4
ADDRLP4 8+8
INDIRI4
ARGI4
ADDRLP4 8+4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 135
ADDP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
CNSTI4 18
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1774
;1773:
;1774:  Q_strncpyz(b->banner, G_admin_get_adminname(ent), sizeof(b->banner));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 G_admin_get_adminname
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1776
;1775:
;1776:  if (!seconds)
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $1142
line 1777
;1777:    b->expires = 0;
ADDRLP4 4
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $1143
JUMPV
LABELV $1142
line 1779
;1778:  else
;1779:    b->expires = t + seconds;
ADDRLP4 4
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 44
INDIRI4
ADDRFP4 16
INDIRI4
ADDI4
ASGNI4
LABELV $1143
line 1780
;1780:  if (!*reason)
ADDRFP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1144
line 1781
;1781:    Q_strncpyz(b->reason, "banned by admin", sizeof(b->reason));
ADDRLP4 4
INDIRP4
CNSTI4 85
ADDP4
ARGP4
ADDRGP4 $1146
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $1145
JUMPV
LABELV $1144
line 1783
;1782:  else
;1783:    Q_strncpyz(b->reason, reason, sizeof(b->reason));
ADDRLP4 4
INDIRP4
CNSTI4 85
ADDP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $1145
line 1784
;1784:  for(i = 0;i < MAX_ADMIN_BANS && g_admin_bans[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1150
JUMPV
LABELV $1147
line 1785
;1785:    ;
LABELV $1148
line 1784
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1150
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $1151
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1147
LABELV $1151
line 1786
;1786:  if (i == MAX_ADMIN_BANS)
ADDRLP4 0
INDIRI4
CNSTI4 1024
NEI4 $1152
line 1787
;1787:  {
line 1788
;1788:    ADMP("^3!ban: ^7too many bans\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1154
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1789
;1789:    G_Free(b);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_Free
CALLV
pop
line 1790
;1790:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1133
JUMPV
LABELV $1152
line 1792
;1791:  }
;1792:  g_admin_bans[i] = b;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 1793
;1793:  return qtrue;
CNSTI4 1
RETI4
LABELV $1133
endproc admin_create_ban 68 28
export G_admin_kick
proc G_admin_kick 1452 24
line 1798
;1794:}
;1795:
;1796:qboolean
;1797:G_admin_kick(gentity_t *ent, int skiparg)
;1798:{
line 1805
;1799:  int pids[MAX_CLIENTS];
;1800:  char name[MAX_NAME_LENGTH], *reason, err[MAX_STRING_CHARS];
;1801:  int minargc;
;1802:  gentity_t *vic;
;1803:  char notice[51];
;1804:
;1805:  trap_Cvar_VariableStringBuffer("g_banNotice", notice, sizeof(notice));
ADDRGP4 $730
ARGP4
ADDRLP4 296
ARGP4
CNSTI4 51
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1807
;1806:
;1807:  minargc = 3 + skiparg;
ADDRLP4 348
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 1808
;1808:  if (G_admin_permission(ent, ADMF_UNACCOUNTABLE))
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1158
ARGP4
ADDRLP4 1376
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1376
INDIRI4
CNSTI4 0
EQI4 $1156
line 1809
;1809:    minargc = 2 + skiparg;
ADDRLP4 348
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
LABELV $1156
line 1811
;1810:
;1811:  if (G_SayArgc() < minargc)
ADDRLP4 1380
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 1380
INDIRI4
ADDRLP4 348
INDIRI4
GEI4 $1159
line 1812
;1812:  {
line 1813
;1813:    ADMP("^3!kick: ^7usage: !kick [name] [reason]\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1161
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1814
;1814:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1155
JUMPV
LABELV $1159
line 1816
;1815:  }
;1816:  G_SayArgv(1 + skiparg, name, sizeof(name));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 264
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 1817
;1817:  reason = G_SayConcatArgs(2 + skiparg);
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 1384
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1384
INDIRP4
ASGNP4
line 1818
;1818:  if (G_ClientNumbersFromString(name, pids) != 1)
ADDRLP4 264
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1388
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 1388
INDIRI4
CNSTI4 1
EQI4 $1162
line 1819
;1819:  {
line 1820
;1820:    G_MatchOnePlayer(pids, err, sizeof(err));
ADDRLP4 4
ARGP4
ADDRLP4 352
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLI4
pop
line 1821
;1821:    ADMP(va("^3!kick: ^7%s\n", err));
ADDRGP4 $1164
ARGP4
ADDRLP4 352
ARGP4
ADDRLP4 1392
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1392
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1822
;1822:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1155
JUMPV
LABELV $1162
line 1824
;1823:  }
;1824:  if (!admin_higher(ent, &g_entities[pids[0]]))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1392
ADDRGP4 admin_higher
CALLI4
ASGNI4
ADDRLP4 1392
INDIRI4
CNSTI4 0
NEI4 $1165
line 1825
;1825:  {
line 1826
;1826:    ADMP("^3!kick: ^7sorry, but your intended victim has a higher admin"
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1167
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1828
;1827:        " level than you\n");
;1828:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1155
JUMPV
LABELV $1165
line 1830
;1829:  }
;1830:  vic = &g_entities[pids[0]];
ADDRLP4 260
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1831
;1831:  admin_create_ban(ent, vic->client->pers.netname, vic->client->pers.guid, vic->client->pers.ip, G_admin_parse_time(g_adminTempBan.string), (*reason) ? reason
ADDRGP4 g_adminTempBan+16
ARGP4
ADDRLP4 1400
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1404
CNSTI4 516
ASGNI4
ADDRLP4 1408
ADDRLP4 260
INDIRP4
ADDRLP4 1404
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1408
INDIRP4
ADDRLP4 1404
INDIRI4
ADDP4
ARGP4
ADDRLP4 1408
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 1408
INDIRP4
CNSTI4 729
ADDP4
ARGP4
ADDRLP4 1400
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1171
ADDRLP4 1396
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $1172
JUMPV
LABELV $1171
ADDRLP4 1396
ADDRGP4 $1169
ASGNP4
LABELV $1172
ADDRLP4 1396
INDIRP4
ARGP4
ADDRGP4 admin_create_ban
CALLI4
pop
line 1833
;1832:      : "kicked by admin");
;1833:  if (g_admin.string[0])
ADDRGP4 g_admin+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1173
line 1834
;1834:    admin_writeconfig();
ADDRGP4 admin_writeconfig
CALLV
pop
LABELV $1173
line 1836
;1835:
;1836:  trap_SendServerCommand(pids[0], va("disconnect \"You have been kicked.\n%s^7\nreason:\n%s\n%s\"", (ent) ? va("admin:\n%s", G_admin_adminPrintName(ent))
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1181
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1420
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRGP4 $1177
ARGP4
ADDRLP4 1420
INDIRP4
ARGP4
ADDRLP4 1424
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1412
ADDRLP4 1424
INDIRP4
ASGNP4
ADDRGP4 $1182
JUMPV
LABELV $1181
ADDRLP4 1412
ADDRGP4 $1178
ASGNP4
LABELV $1182
ADDRGP4 $1176
ARGP4
ADDRLP4 1412
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1183
ADDRLP4 1416
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $1184
JUMPV
LABELV $1183
ADDRLP4 1416
ADDRGP4 $1169
ASGNP4
LABELV $1184
ADDRLP4 1416
INDIRP4
ARGP4
ADDRLP4 296
ARGP4
ADDRLP4 1428
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1428
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1839
;1837:      : "admin\nconsole", (*reason) ? reason : "kicked by admin", notice));
;1838:
;1839:  trap_DropClient(pids[0], va("kicked%s^7, reason: %s", (ent) ? va(" by %s", G_admin_adminPrintName(ent)) : " by console", (*reason) ? reason
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1190
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1440
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRGP4 $1186
ARGP4
ADDRLP4 1440
INDIRP4
ARGP4
ADDRLP4 1444
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1432
ADDRLP4 1444
INDIRP4
ASGNP4
ADDRGP4 $1191
JUMPV
LABELV $1190
ADDRLP4 1432
ADDRGP4 $1187
ASGNP4
LABELV $1191
ADDRGP4 $1185
ARGP4
ADDRLP4 1432
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1192
ADDRLP4 1436
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $1193
JUMPV
LABELV $1192
ADDRLP4 1436
ADDRGP4 $1169
ASGNP4
LABELV $1193
ADDRLP4 1436
INDIRP4
ARGP4
ADDRLP4 1448
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1448
INDIRP4
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 1842
;1840:      : "kicked by admin"));
;1841:
;1842:  return qtrue;
CNSTI4 1
RETI4
LABELV $1155
endproc G_admin_kick 1452 24
export G_admin_ban
proc G_admin_ban 316 24
line 1847
;1843:}
;1844:
;1845:qboolean
;1846:G_admin_ban(gentity_t *ent, int skiparg)
;1847:{
line 1854
;1848:  int seconds;
;1849:  char search[MAX_NAME_LENGTH];
;1850:  char secs[7];
;1851:  char *reason;
;1852:  int minargc;
;1853:  char duration[32];
;1854:  int logmatch = -1, logmatches = 0;
ADDRLP4 72
CNSTI4 -1
ASGNI4
ADDRLP4 88
CNSTI4 0
ASGNI4
line 1856
;1855:  int i, j;
;1856:  qboolean exactmatch = qfalse;
ADDRLP4 92
CNSTI4 0
ASGNI4
line 1862
;1857:  char n2[MAX_NAME_LENGTH];
;1858:  char s2[MAX_NAME_LENGTH];
;1859:  char guid_stub[9];
;1860:  char notice[51];
;1861:
;1862:  trap_Cvar_VariableStringBuffer("g_banNotice", notice, sizeof(notice));
ADDRGP4 $730
ARGP4
ADDRLP4 175
ARGP4
CNSTI4 51
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1864
;1863:
;1864:  if (G_admin_permission(ent, ADMF_CAN_PERM_BAN) && G_admin_permission(ent, ADMF_UNACCOUNTABLE))
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1197
ARGP4
ADDRLP4 232
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 0
EQI4 $1195
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1158
ARGP4
ADDRLP4 236
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 0
EQI4 $1195
line 1865
;1865:  {
line 1866
;1866:    minargc = 2 + skiparg;
ADDRLP4 228
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 1867
;1867:  }
ADDRGP4 $1196
JUMPV
LABELV $1195
line 1868
;1868:  else if ((G_admin_permission(ent, ADMF_CAN_PERM_BAN) || g_adminMaxBan.integer) || G_admin_permission(ent, ADMF_UNACCOUNTABLE))
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1197
ARGP4
ADDRLP4 240
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 244
CNSTI4 0
ASGNI4
ADDRLP4 240
INDIRI4
ADDRLP4 244
INDIRI4
NEI4 $1201
ADDRGP4 g_adminMaxBan+12
INDIRI4
ADDRLP4 244
INDIRI4
NEI4 $1201
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1158
ARGP4
ADDRLP4 248
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 248
INDIRI4
CNSTI4 0
EQI4 $1198
LABELV $1201
line 1869
;1869:  {
line 1870
;1870:    minargc = 3 + skiparg;
ADDRLP4 228
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 1871
;1871:  }
ADDRGP4 $1199
JUMPV
LABELV $1198
line 1873
;1872:  else
;1873:  {
line 1874
;1874:    minargc = 4 + skiparg;
ADDRLP4 228
ADDRFP4 4
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 1875
;1875:  }
LABELV $1199
LABELV $1196
line 1876
;1876:  if (G_SayArgc() < minargc)
ADDRLP4 252
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 252
INDIRI4
ADDRLP4 228
INDIRI4
GEI4 $1202
line 1877
;1877:  {
line 1878
;1878:    ADMP("^3!ban: ^7usage: !ban [name|slot|ip] [time] [reason]\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1204
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1879
;1879:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1202
line 1881
;1880:  }
;1881:  G_SayArgv(1 + skiparg, search, sizeof(search));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 136
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 1882
;1882:  G_SanitiseString(search, s2, sizeof(s2));
ADDRLP4 136
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 1883
;1883:  G_SayArgv(2 + skiparg, secs, sizeof(secs));
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 168
ARGP4
CNSTI4 7
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 1885
;1884:
;1885:  seconds = G_admin_parse_time(secs);
ADDRLP4 168
ARGP4
ADDRLP4 256
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 256
INDIRI4
ASGNI4
line 1886
;1886:  if (seconds <= 0)
ADDRLP4 100
INDIRI4
CNSTI4 0
GTI4 $1205
line 1887
;1887:  {
line 1888
;1888:    if (g_adminMaxBan.integer && !G_admin_permission(ent, ADMF_CAN_PERM_BAN))
ADDRGP4 g_adminMaxBan+12
INDIRI4
CNSTI4 0
EQI4 $1207
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1197
ARGP4
ADDRLP4 260
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $1207
line 1889
;1889:    {
line 1890
;1890:      ADMP(va("^3!ban: ^7using your admin level's maximum ban length of %s\n",
ADDRGP4 $1210
ARGP4
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 264
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 264
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1892
;1891:              g_adminMaxBan.string));
;1892:      seconds = G_admin_parse_time(g_adminMaxBan.string);
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 268
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 268
INDIRI4
ASGNI4
line 1893
;1893:    }
ADDRGP4 $1208
JUMPV
LABELV $1207
line 1894
;1894:    else if (G_admin_permission(ent, ADMF_CAN_PERM_BAN))
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1197
ARGP4
ADDRLP4 264
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $1213
line 1895
;1895:    {
line 1896
;1896:      seconds = 0;
ADDRLP4 100
CNSTI4 0
ASGNI4
line 1897
;1897:    }
ADDRGP4 $1214
JUMPV
LABELV $1213
line 1899
;1898:    else
;1899:    {
line 1900
;1900:      ADMP("^3!ban: ^7ban time must be positive\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1215
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1901
;1901:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1214
LABELV $1208
line 1903
;1902:    }
;1903:    reason = G_SayConcatArgs(2 + skiparg);
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 268
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 96
ADDRLP4 268
INDIRP4
ASGNP4
line 1904
;1904:  }
ADDRGP4 $1206
JUMPV
LABELV $1205
line 1906
;1905:  else
;1906:  {
line 1907
;1907:    reason = G_SayConcatArgs(3 + skiparg);
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRLP4 260
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 96
ADDRLP4 260
INDIRP4
ASGNP4
line 1909
;1908:
;1909:    if (g_adminMaxBan.integer && seconds > G_admin_parse_time(g_adminMaxBan.string) && !G_admin_permission(ent, ADMF_CAN_PERM_BAN))
ADDRGP4 g_adminMaxBan+12
INDIRI4
CNSTI4 0
EQI4 $1216
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 264
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
ADDRLP4 264
INDIRI4
LEI4 $1216
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1197
ARGP4
ADDRLP4 268
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $1216
line 1910
;1910:    {
line 1911
;1911:      seconds = G_admin_parse_time(g_adminMaxBan.string);
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 272
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRLP4 100
ADDRLP4 272
INDIRI4
ASGNI4
line 1912
;1912:      ADMP(va("^3!ban: ^7ban length limited to %s for your admin level\n",
ADDRGP4 $1221
ARGP4
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 276
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 276
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1914
;1913:              g_adminMaxBan.string));
;1914:    }
LABELV $1216
line 1915
;1915:  }
LABELV $1206
line 1917
;1916:
;1917:  for(i = 0;i < MAX_ADMIN_NAMELOGS && g_admin_namelog[i];i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1226
JUMPV
LABELV $1223
line 1918
;1918:  {
line 1920
;1919:    // skip players in the namelog who have already been banned
;1920:    if (g_admin_namelog[i]->banned)
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1227
line 1921
;1921:      continue;
ADDRGP4 $1224
JUMPV
LABELV $1227
line 1924
;1922:
;1923:    // skip disconnected players when banning on slot number
;1924:    if (g_admin_namelog[i]->slot == -1)
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1229
line 1925
;1925:      continue;
ADDRGP4 $1224
JUMPV
LABELV $1229
line 1927
;1926:
;1927:    if (!Q_stricmp(va("%d", g_admin_namelog[i]->slot), s2))
ADDRGP4 $419
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 260
INDIRP4
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 264
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $1231
line 1928
;1928:    {
line 1929
;1929:      logmatches = 1;
ADDRLP4 88
CNSTI4 1
ASGNI4
line 1930
;1930:      logmatch = i;
ADDRLP4 72
ADDRLP4 4
INDIRI4
ASGNI4
line 1931
;1931:      exactmatch = qtrue;
ADDRLP4 92
CNSTI4 1
ASGNI4
line 1932
;1932:      break;
ADDRGP4 $1225
JUMPV
LABELV $1231
line 1934
;1933:    }
;1934:  }
LABELV $1224
line 1917
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1226
ADDRLP4 4
INDIRI4
CNSTI4 128
GEI4 $1233
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1223
LABELV $1233
LABELV $1225
line 1936
;1935:
;1936:  for(i = 0;!exactmatch && i < MAX_ADMIN_NAMELOGS && g_admin_namelog[i];i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1237
JUMPV
LABELV $1234
line 1937
;1937:  {
line 1939
;1938:    // skip players in the namelog who have already been banned
;1939:    if (g_admin_namelog[i]->banned)
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1238
line 1940
;1940:      continue;
ADDRGP4 $1235
JUMPV
LABELV $1238
line 1942
;1941:
;1942:    if (!Q_stricmp(g_admin_namelog[i]->ip, s2))
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 264
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $1240
line 1943
;1943:    {
line 1944
;1944:      logmatches = 1;
ADDRLP4 88
CNSTI4 1
ASGNI4
line 1945
;1945:      logmatch = i;
ADDRLP4 72
ADDRLP4 4
INDIRI4
ASGNI4
line 1946
;1946:      exactmatch = qtrue;
ADDRLP4 92
CNSTI4 1
ASGNI4
line 1947
;1947:      break;
ADDRGP4 $1236
JUMPV
LABELV $1240
line 1949
;1948:    }
;1949:    for(j = 0;j < MAX_ADMIN_NAMELOG_NAMES && g_admin_namelog[i]->name[j][0];j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1245
JUMPV
LABELV $1242
line 1950
;1950:    {
line 1951
;1951:      G_SanitiseString(g_admin_namelog[i]->name[j], n2, sizeof(n2));
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 1952
;1952:      if (strstr(n2, s2))
ADDRLP4 8
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 268
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 268
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1246
line 1953
;1953:      {
line 1954
;1954:        if (logmatch != i)
ADDRLP4 72
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $1248
line 1955
;1955:          logmatches++;
ADDRLP4 88
ADDRLP4 88
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1248
line 1956
;1956:        logmatch = i;
ADDRLP4 72
ADDRLP4 4
INDIRI4
ASGNI4
line 1957
;1957:      }
LABELV $1246
line 1958
;1958:    }
LABELV $1243
line 1949
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1245
ADDRLP4 272
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 272
INDIRI4
GEI4 $1250
ADDRLP4 0
INDIRI4
ADDRLP4 272
INDIRI4
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1242
LABELV $1250
line 1959
;1959:  }
LABELV $1235
line 1936
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1237
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $1252
ADDRLP4 4
INDIRI4
CNSTI4 128
GEI4 $1252
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1234
LABELV $1252
LABELV $1236
line 1961
;1960:
;1961:  if (!logmatches)
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $1253
line 1962
;1962:  {
line 1963
;1963:    ADMP("^3!ban: ^7no player found by that name, IP, or slot number\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1255
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 1964
;1964:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1253
line 1966
;1965:  }
;1966:  else if (logmatches > 1)
ADDRLP4 88
INDIRI4
CNSTI4 1
LEI4 $1256
line 1967
;1967:  {
line 1968
;1968:    ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 1969
;1969:    ADMBP("^3!ban: ^7multiple recent clients match name, use IP or slot#:\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1258
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 1970
;1970:    for(i = 0;i < MAX_ADMIN_NAMELOGS && g_admin_namelog[i];i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1262
JUMPV
LABELV $1259
line 1971
;1971:    {
line 1972
;1972:      for(j = 0;j < 8;j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1263
line 1973
;1973:        guid_stub[j] = g_admin_namelog[i]->guid[j + 24];
ADDRLP4 0
INDIRI4
ADDRLP4 76
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ADDP4
INDIRI1
ASGNI1
LABELV $1264
line 1972
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $1263
line 1974
;1974:      guid_stub[j] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 76
ADDP4
CNSTI1 0
ASGNI1
line 1975
;1975:      for(j = 0;j < MAX_ADMIN_NAMELOG_NAMES && g_admin_namelog[i]->name[j][0];j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1270
JUMPV
LABELV $1267
line 1976
;1976:      {
line 1977
;1977:        G_SanitiseString(g_admin_namelog[i]->name[j], n2, sizeof(n2));
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 1978
;1978:        if (strstr(n2, s2))
ADDRLP4 8
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 272
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 272
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1271
line 1979
;1979:        {
line 1980
;1980:          if (g_admin_namelog[i]->slot > -1)
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 -1
LEI4 $1273
line 1981
;1981:            ADMBP("^3");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1275
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
LABELV $1273
line 1982
;1982:          ADMBP(va("%-2s (*%s) %15s ^7'%s^7'\n",
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 -1
LEI4 $1279
ADDRGP4 $419
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 276
ADDRLP4 280
INDIRP4
ASGNP4
ADDRGP4 $1280
JUMPV
LABELV $1279
ADDRLP4 276
ADDRGP4 $1277
ASGNP4
LABELV $1280
ADDRGP4 $1276
ARGP4
ADDRLP4 276
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 284
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ASGNP4
ADDRLP4 284
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 284
INDIRP4
ADDP4
ARGP4
ADDRLP4 288
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 1986
;1983:                  (g_admin_namelog[i]->slot > -1) ? va("%d",
;1984:                      g_admin_namelog[i]->slot) : "-", guid_stub,
;1985:                  g_admin_namelog[i]->ip, g_admin_namelog[i]->name[j]));
;1986:        }
LABELV $1271
line 1987
;1987:      }
LABELV $1268
line 1975
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1270
ADDRLP4 276
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 276
INDIRI4
GEI4 $1281
ADDRLP4 0
INDIRI4
ADDRLP4 276
INDIRI4
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1267
LABELV $1281
line 1988
;1988:    }
LABELV $1260
line 1970
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1262
ADDRLP4 4
INDIRI4
CNSTI4 128
GEI4 $1282
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1259
LABELV $1282
line 1989
;1989:    ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 1990
;1990:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1256
line 1993
;1991:  }
;1992:
;1993:  G_admin_duration((seconds) ? seconds : -1, duration, sizeof(duration));
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $1284
ADDRLP4 268
ADDRLP4 100
INDIRI4
ASGNI4
ADDRGP4 $1285
JUMPV
LABELV $1284
ADDRLP4 268
CNSTI4 -1
ASGNI4
LABELV $1285
ADDRLP4 268
INDIRI4
ARGI4
ADDRLP4 104
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_admin_duration
CALLV
pop
line 1995
;1994:
;1995:  if (ent && !admin_higher_guid(ent->client->pers.guid, g_admin_namelog[logmatch]->guid))
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1286
ADDRLP4 272
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 276
ADDRGP4 admin_higher_guid
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
NEI4 $1286
line 1996
;1996:  {
line 1998
;1997:
;1998:    ADMP("^3!ban: ^7sorry, but your intended victim has a higher admin"
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1288
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2000
;1999:        " level than you\n");
;2000:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1286
line 2003
;2001:  }
;2002:
;2003:  admin_create_ban(ent, g_admin_namelog[logmatch]->name[0], g_admin_namelog[logmatch]->guid, g_admin_namelog[logmatch]->ip, seconds, reason);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ASGNP4
ADDRLP4 280
INDIRP4
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 admin_create_ban
CALLI4
pop
line 2005
;2004:
;2005:  g_admin_namelog[logmatch]->banned = qtrue;
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 1
ASGNI4
line 2007
;2006:
;2007:  if (!g_admin.string[0])
ADDRGP4 g_admin+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1289
line 2008
;2008:    ADMP(
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1292
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
ADDRGP4 $1290
JUMPV
LABELV $1289
line 2011
;2009:        "^3!ban: ^7WARNING g_admin not set, not saving ban to a file\n");
;2010:  else
;2011:    admin_writeconfig();
ADDRGP4 admin_writeconfig
CALLV
pop
LABELV $1290
line 2013
;2012:
;2013:  if (g_admin_namelog[logmatch]->slot == -1)
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $1293
line 2014
;2014:  {
line 2016
;2015:    // client is already disconnected so stop here
;2016:    AP(va("print \"^3!ban:^7 %s^7 has been banned by %s^7 "
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1298
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 292
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 284
ADDRLP4 292
INDIRP4
ASGNP4
ADDRGP4 $1299
JUMPV
LABELV $1298
ADDRLP4 284
ADDRGP4 $342
ASGNP4
LABELV $1299
ADDRGP4 $1295
ARGP4
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ARGP4
ADDRLP4 284
INDIRP4
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 96
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1300
ADDRLP4 288
ADDRLP4 96
INDIRP4
ASGNP4
ADDRGP4 $1301
JUMPV
LABELV $1300
ADDRLP4 288
ADDRGP4 $1146
ASGNP4
LABELV $1301
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 296
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2020
;2017:            "duration: %s, reason: %s\n\"", g_admin_namelog[logmatch]->name[0],
;2018:            (ent) ? G_admin_adminPrintName(ent) : "console", duration,
;2019:            (*reason) ? reason : "banned by admin"));
;2020:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1293
line 2023
;2021:  }
;2022:
;2023:  trap_SendServerCommand(g_admin_namelog[logmatch]->slot,
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1305
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 292
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 284
ADDRLP4 292
INDIRP4
ASGNP4
ADDRGP4 $1306
JUMPV
LABELV $1305
ADDRLP4 284
ADDRGP4 $342
ASGNP4
LABELV $1306
ADDRGP4 $1302
ARGP4
ADDRLP4 284
INDIRP4
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 96
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1307
ADDRLP4 288
ADDRLP4 96
INDIRP4
ASGNP4
ADDRGP4 $1308
JUMPV
LABELV $1307
ADDRLP4 288
ADDRGP4 $1146
ASGNP4
LABELV $1308
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 175
ARGP4
ADDRLP4 296
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2028
;2024:      va("disconnect \"You have been banned.\n"
;2025:        "admin:\n%s^7\nduration:\n%s\nreason:\n%s\n%s\"", (ent) ? G_admin_adminPrintName(ent) : "console", duration, (*reason) ? reason : "banned by admin",
;2026:          notice));
;2027:
;2028:  trap_DropClient(g_admin_namelog[logmatch]->slot, va("banned by %s^7, duration: %s, reason: %s", (ent) ? G_admin_adminPrintName(ent) : "console", duration,
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1312
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 300
ADDRLP4 308
INDIRP4
ASGNP4
ADDRGP4 $1313
JUMPV
LABELV $1312
ADDRLP4 300
ADDRGP4 $342
ASGNP4
LABELV $1313
ADDRGP4 $1309
ARGP4
ADDRLP4 300
INDIRP4
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 96
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1314
ADDRLP4 304
ADDRLP4 96
INDIRP4
ASGNP4
ADDRGP4 $1315
JUMPV
LABELV $1314
ADDRLP4 304
ADDRGP4 $1146
ASGNP4
LABELV $1315
ADDRLP4 304
INDIRP4
ARGP4
ADDRLP4 312
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
INDIRP4
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 2030
;2029:      (*reason) ? reason : "banned by admin"));
;2030:  return qtrue;
CNSTI4 1
RETI4
LABELV $1194
endproc G_admin_ban 316 24
lit
align 1
LABELV $1317
byte 1 0
skip 31
export G_admin_adjustban
code
proc G_admin_adjustban 1164 36
line 2035
;2031:}
;2032:
;2033:qboolean
;2034:G_admin_adjustban(gentity_t *ent, int skiparg)
;2035:{
line 2039
;2036:  int bnum;
;2037:  int length;
;2038:  int expires;
;2039:  int time = trap_RealTime(NULL);
CNSTP4 0
ARGP4
ADDRLP4 1084
ADDRGP4 trap_RealTime
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1084
INDIRI4
ASGNI4
line 2041
;2040:  char duration[32] =
;2041:  { "" };
ADDRLP4 1041
ADDRGP4 $1317
INDIRB
ASGNB 32
line 2045
;2042:  char *reason;
;2043:  char bs[5];
;2044:  char secs[MAX_TOKEN_CHARS];
;2045:  char mode = '\0';
ADDRLP4 1040
CNSTI1 0
ASGNI1
line 2047
;2046:
;2047:  if (G_SayArgc() < 3 + skiparg)
ADDRLP4 1088
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
GEI4 $1318
line 2048
;2048:  {
line 2049
;2049:    ADMP("^3!adjustban: ^7usage: !adjustban [ban#] [time] [reason]\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1320
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2050
;2050:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1316
JUMPV
LABELV $1318
line 2052
;2051:  }
;2052:  G_SayArgv(1 + skiparg, bs, sizeof(bs));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1073
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2053
;2053:  bnum = atoi(bs);
ADDRLP4 1073
ARGP4
ADDRLP4 1092
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1092
INDIRI4
ASGNI4
line 2054
;2054:  if (bnum < 1 || bnum > MAX_ADMIN_BANS || !g_admin_bans[bnum - 1])
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $1325
ADDRLP4 0
INDIRI4
CNSTI4 1024
GTI4 $1325
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1321
LABELV $1325
line 2055
;2055:  {
line 2056
;2056:    ADMP("^3!adjustban: ^7invalid ban#\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1326
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2057
;2057:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1316
JUMPV
LABELV $1321
line 2059
;2058:  }
;2059:  if (g_admin_bans[bnum - 1]->expires == 0 && !G_admin_permission(ent, ADMF_CAN_PERM_BAN))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1327
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1197
ARGP4
ADDRLP4 1100
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $1327
line 2060
;2060:  {
line 2061
;2061:    ADMP("^3!adjustban: ^7you cannot modify permanent bans\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1330
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2062
;2062:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1316
JUMPV
LABELV $1327
line 2064
;2063:  }
;2064:  if (g_adminMaxBan.integer && !G_admin_permission(ent, ADMF_CAN_PERM_BAN) && g_admin_bans[bnum - 1]->expires - time > G_admin_parse_time(g_adminMaxBan.string))
ADDRGP4 g_adminMaxBan+12
INDIRI4
CNSTI4 0
EQI4 $1331
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1197
ARGP4
ADDRLP4 1104
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $1331
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 1108
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ADDRLP4 1036
INDIRI4
SUBI4
ADDRLP4 1108
INDIRI4
LEI4 $1331
line 2065
;2065:  {
line 2066
;2066:    ADMP(va(
ADDRGP4 $1336
ARGP4
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2069
;2067:            "^3!adjustban: ^7your admin level cannot modify bans longer than %s\n",
;2068:            g_adminMaxBan.string));
;2069:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1316
JUMPV
LABELV $1331
line 2071
;2070:  }
;2071:  G_SayArgv(2 + skiparg, secs, sizeof(secs));
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2072
;2072:  if (secs[0] == '+' || secs[0] == '-')
ADDRLP4 1112
ADDRLP4 8
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 43
EQI4 $1340
ADDRLP4 1112
INDIRI4
CNSTI4 45
NEI4 $1338
LABELV $1340
line 2073
;2073:    mode = secs[0];
ADDRLP4 1040
ADDRLP4 8
INDIRI1
ASGNI1
LABELV $1338
line 2074
;2074:  length = G_admin_parse_time(&secs[mode ? 1 : 0]);
ADDRLP4 1040
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1342
ADDRLP4 1116
CNSTI4 1
ASGNI4
ADDRGP4 $1343
JUMPV
LABELV $1342
ADDRLP4 1116
CNSTI4 0
ASGNI4
LABELV $1343
ADDRLP4 1116
INDIRI4
ADDRLP4 8
ADDP4
ARGP4
ADDRLP4 1120
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1120
INDIRI4
ASGNI4
line 2075
;2075:  if (length < 0)
ADDRLP4 1032
INDIRI4
CNSTI4 0
GEI4 $1344
line 2076
;2076:    skiparg--;
ADDRFP4 4
ADDRFP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $1345
JUMPV
LABELV $1344
line 2078
;2077:  else
;2078:  {
line 2079
;2079:    if (length)
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $1346
line 2080
;2080:    {
line 2081
;2081:      if (g_admin_bans[bnum - 1]->expires == 0 && mode)
ADDRLP4 1124
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ADDRLP4 1124
INDIRI4
NEI4 $1348
ADDRLP4 1040
INDIRI1
CVII4 1
ADDRLP4 1124
INDIRI4
EQI4 $1348
line 2082
;2082:      {
line 2083
;2083:        ADMP("^3!adjustban: ^7new duration must be explicit\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1351
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2084
;2084:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1316
JUMPV
LABELV $1348
line 2086
;2085:      }
;2086:      if (mode == '+')
ADDRLP4 1040
INDIRI1
CVII4 1
CNSTI4 43
NEI4 $1352
line 2087
;2087:        expires = g_admin_bans[bnum - 1]->expires + length;
ADDRLP4 1080
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ADDRLP4 1032
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $1353
JUMPV
LABELV $1352
line 2088
;2088:      else if (mode == '-')
ADDRLP4 1040
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $1355
line 2089
;2089:        expires = g_admin_bans[bnum - 1]->expires - length;
ADDRLP4 1080
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ADDRLP4 1032
INDIRI4
SUBI4
ASGNI4
ADDRGP4 $1356
JUMPV
LABELV $1355
line 2091
;2090:      else
;2091:        expires = time + length;
ADDRLP4 1080
ADDRLP4 1036
INDIRI4
ADDRLP4 1032
INDIRI4
ADDI4
ASGNI4
LABELV $1356
LABELV $1353
line 2092
;2092:      if (expires <= time)
ADDRLP4 1080
INDIRI4
ADDRLP4 1036
INDIRI4
GTI4 $1358
line 2093
;2093:      {
line 2094
;2094:        ADMP("^3!adjustban: ^7ban time must be positive\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1360
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2095
;2095:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1316
JUMPV
LABELV $1358
line 2097
;2096:      }
;2097:      if (g_adminMaxBan.integer && !G_admin_permission(ent, ADMF_CAN_PERM_BAN) && expires - time > G_admin_parse_time(g_adminMaxBan.string))
ADDRGP4 g_adminMaxBan+12
INDIRI4
CNSTI4 0
EQI4 $1347
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1197
ARGP4
ADDRLP4 1128
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $1347
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 1132
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
ADDRLP4 1036
INDIRI4
SUBI4
ADDRLP4 1132
INDIRI4
LEI4 $1347
line 2098
;2098:      {
line 2099
;2099:        ADMP(
ADDRGP4 $1365
ARGP4
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 1136
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1136
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2103
;2100:            va(
;2101:                "^3!adjustban: ^7ban length is limited to %s for your admin level\n",
;2102:                g_adminMaxBan.string));
;2103:        length = G_admin_parse_time(g_adminMaxBan.string);
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 1140
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1140
INDIRI4
ASGNI4
line 2104
;2104:        expires = time + length;
ADDRLP4 1080
ADDRLP4 1036
INDIRI4
ADDRLP4 1032
INDIRI4
ADDI4
ASGNI4
line 2105
;2105:      }
line 2106
;2106:    }
ADDRGP4 $1347
JUMPV
LABELV $1346
line 2107
;2107:    else if (G_admin_permission(ent, ADMF_CAN_PERM_BAN))
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1197
ARGP4
ADDRLP4 1124
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
EQI4 $1368
line 2108
;2108:      expires = 0;
ADDRLP4 1080
CNSTI4 0
ASGNI4
ADDRGP4 $1369
JUMPV
LABELV $1368
line 2110
;2109:    else
;2110:    {
line 2111
;2111:      ADMP("^3!adjustban: ^7ban time must be positive\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1360
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2112
;2112:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1316
JUMPV
LABELV $1369
LABELV $1347
line 2115
;2113:    }
;2114:
;2115:    g_admin_bans[bnum - 1]->expires = expires;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 1080
INDIRI4
ASGNI4
line 2116
;2116:    G_admin_duration((expires) ? expires - time : -1, duration, sizeof(duration));
ADDRLP4 1080
INDIRI4
CNSTI4 0
EQI4 $1372
ADDRLP4 1128
ADDRLP4 1080
INDIRI4
ADDRLP4 1036
INDIRI4
SUBI4
ASGNI4
ADDRGP4 $1373
JUMPV
LABELV $1372
ADDRLP4 1128
CNSTI4 -1
ASGNI4
LABELV $1373
ADDRLP4 1128
INDIRI4
ARGI4
ADDRLP4 1041
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_admin_duration
CALLV
pop
line 2117
;2117:  }
LABELV $1345
line 2118
;2118:  reason = G_SayConcatArgs(3 + skiparg);
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRLP4 1124
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1124
INDIRP4
ASGNP4
line 2119
;2119:  if (*reason)
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1374
line 2120
;2120:    Q_strncpyz(g_admin_bans[bnum - 1]->reason, reason, sizeof(g_admin_bans[bnum - 1]->reason));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CNSTI4 85
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $1374
line 2121
;2121:  AP(
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1387
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1144
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 1128
ADDRLP4 1144
INDIRP4
ASGNP4
ADDRGP4 $1388
JUMPV
LABELV $1387
ADDRLP4 1128
ADDRGP4 $342
ASGNP4
LABELV $1388
ADDRGP4 $1378
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1128
INDIRP4
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 0
LTI4 $1389
ADDRLP4 1132
ADDRGP4 $1381
ASGNP4
ADDRGP4 $1390
JUMPV
LABELV $1389
ADDRLP4 1132
ADDRGP4 $93
ASGNP4
LABELV $1390
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1041
ARGP4
ADDRLP4 1152
CNSTI4 0
ASGNI4
ADDRLP4 1032
INDIRI4
ADDRLP4 1152
INDIRI4
LTI4 $1391
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 1152
INDIRI4
EQI4 $1391
ADDRLP4 1136
ADDRGP4 $1383
ASGNP4
ADDRGP4 $1392
JUMPV
LABELV $1391
ADDRLP4 1136
ADDRGP4 $93
ASGNP4
LABELV $1392
ADDRLP4 1136
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1393
ADDRLP4 1140
ADDRGP4 $1385
ASGNP4
ADDRGP4 $1394
JUMPV
LABELV $1393
ADDRLP4 1140
ADDRGP4 $93
ASGNP4
LABELV $1394
ADDRLP4 1140
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1156
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2128
;2122:      va("print \"^3!adjustban: ^7ban #%d for %s^7 has been updated by %s^7 "
;2123:          "%s%s%s%s%s\n\"", bnum, g_admin_bans[bnum - 1]->name,
;2124:          (ent) ? G_admin_adminPrintName(ent) : "console",
;2125:          (length >= 0) ? "duration: " : "", duration,
;2126:          (length >= 0 && *reason) ? ", " : "", (*reason) ? "reason: " : "",
;2127:          reason));
;2128:  if (ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1395
line 2129
;2129:    Q_strncpyz(g_admin_bans[bnum - 1]->banner, G_admin_get_adminname(ent), sizeof(g_admin_bans[bnum - 1]->banner));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1160
ADDRGP4 G_admin_get_adminname
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 1160
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $1395
line 2130
;2130:  if (g_admin.string[0])
ADDRGP4 g_admin+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1399
line 2131
;2131:    admin_writeconfig();
ADDRGP4 admin_writeconfig
CALLV
pop
LABELV $1399
line 2132
;2132:  return qtrue;
CNSTI4 1
RETI4
LABELV $1316
endproc G_admin_adjustban 1164 36
export G_admin_subnetban
proc G_admin_subnetban 160 28
line 2137
;2133:}
;2134:
;2135:qboolean
;2136:G_admin_subnetban(gentity_t *ent, int skiparg)
;2137:{
line 2140
;2138:  int bnum;
;2139:  int mask;
;2140:  unsigned int IPRlow = 0, IPRhigh = 0;
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 36
CNSTU4 0
ASGNU4
line 2147
;2141:  char cIPRlow[32], cIPRhigh[32];
;2142:  char bs[5];
;2143:  char strmask[5];
;2144:  char exl[2];
;2145:  int k, IP[5];
;2146:
;2147:  if (G_SayArgc() < 3 + skiparg)
ADDRLP4 116
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
GEI4 $1403
line 2148
;2148:  {
line 2149
;2149:    ADMP("^3!subnetban: ^7usage: !subnetban [ban#] [mask]\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1405
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2150
;2150:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1402
JUMPV
LABELV $1403
line 2152
;2151:  }
;2152:  G_SayArgv(1 + skiparg, bs, sizeof(bs));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 104
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2153
;2153:  bnum = atoi(bs);
ADDRLP4 104
ARGP4
ADDRLP4 120
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 120
INDIRI4
ASGNI4
line 2154
;2154:  if (bnum < 1 || bnum > MAX_ADMIN_BANS || !g_admin_bans[bnum - 1])
ADDRLP4 24
INDIRI4
CNSTI4 1
LTI4 $1410
ADDRLP4 24
INDIRI4
CNSTI4 1024
GTI4 $1410
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1406
LABELV $1410
line 2155
;2155:  {
line 2156
;2156:    ADMP("^3!subnetban: ^7invalid ban#\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1411
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2157
;2157:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1402
JUMPV
LABELV $1406
line 2160
;2158:  }
;2159:
;2160:  G_SayArgv(2 + skiparg, strmask, sizeof(strmask));
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 109
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2161
;2161:  mask = atoi(strmask);
ADDRLP4 109
ARGP4
ADDRLP4 128
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 128
INDIRI4
ASGNI4
line 2163
;2162:
;2163:  if (mask >= 0 && mask <= 32)
ADDRLP4 32
INDIRI4
CNSTI4 0
LTI4 $1412
ADDRLP4 32
INDIRI4
CNSTI4 32
GTI4 $1412
line 2164
;2164:  {
line 2165
;2165:    G_SayArgv(3 + skiparg, exl, sizeof(exl));
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRLP4 114
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2166
;2166:    if (mask >= 0 && mask < 16)
ADDRLP4 32
INDIRI4
CNSTI4 0
LTI4 $1414
ADDRLP4 32
INDIRI4
CNSTI4 16
GEI4 $1414
line 2167
;2167:    {
line 2168
;2168:      if (ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1416
line 2169
;2169:      {
line 2170
;2170:        ADMP(
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1418
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2172
;2171:            "^3!subnetban: ^7Only console may ban such a large network. Regular admins may only ban >=16.\n");
;2172:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1402
JUMPV
LABELV $1416
line 2174
;2173:      }
;2174:      if (strcmp(exl, "!"))
ADDRLP4 114
ARGP4
ADDRGP4 $1421
ARGP4
ADDRLP4 140
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1419
line 2175
;2175:      {
line 2176
;2176:        ADMP(
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1422
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2178
;2177:            "^3!subnetban: ^1WARNING:^7 you are about to ban a large network, use !subnetban [ban] [mask] ! to force^7\n");
;2178:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1402
JUMPV
LABELV $1419
line 2180
;2179:      }
;2180:    }
LABELV $1414
line 2182
;2181:
;2182:    sscanf(g_admin_bans[bnum - 1]->ip, "%d.%d.%d.%d/%d", &IP[4], &IP[3], &IP[2], &IP[1], &IP[0]);
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRGP4 $759
ARGP4
ADDRLP4 4+16
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 4+8
ARGP4
ADDRLP4 4+4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 2183
;2183:    for(k = 4;k >= 1;k--)
ADDRLP4 0
CNSTI4 4
ASGNI4
LABELV $1428
line 2184
;2184:    {
line 2185
;2185:      if (!IP[k])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1432
line 2186
;2186:        IP[k] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTI4 0
ASGNI4
LABELV $1432
line 2187
;2187:      IPRlow |= IP[k] << 8 * (k - 1);
ADDRLP4 28
ADDRLP4 28
INDIRU4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 8
SUBI4
LSHI4
CVIU4 4
BORU4
ASGNU4
line 2188
;2188:    }
LABELV $1429
line 2183
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
GEI4 $1428
line 2189
;2189:    IPRhigh = IPRlow;
ADDRLP4 36
ADDRLP4 28
INDIRU4
ASGNU4
line 2190
;2190:    if (mask == 32)
ADDRLP4 32
INDIRI4
CNSTI4 32
NEI4 $1434
line 2191
;2191:    {
line 2192
;2192:      Q_strncpyz(g_admin_bans[bnum - 1]->ip, va("%i.%i.%i.%i", IP[4], IP[3], IP[2], IP[1]), sizeof(g_admin_bans[bnum - 1]->ip));
ADDRGP4 $739
ARGP4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRLP4 4+12
INDIRI4
ARGI4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 140
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2193
;2193:    }
ADDRGP4 $1413
JUMPV
LABELV $1434
line 2195
;2194:    else
;2195:    {
line 2196
;2196:      Q_strncpyz(g_admin_bans[bnum - 1]->ip, va("%i.%i.%i.%i/%i", IP[4], IP[3], IP[2], IP[1], mask), sizeof(g_admin_bans[bnum - 1]->ip));
ADDRGP4 $1443
ARGP4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRLP4 4+12
INDIRI4
ARGI4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 140
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2197
;2197:      IPRlow &= ~((1 << (32 - mask)) - 1);
ADDRLP4 144
CNSTI4 1
ASGNI4
ADDRLP4 28
ADDRLP4 28
INDIRU4
ADDRLP4 144
INDIRI4
CNSTI4 32
ADDRLP4 32
INDIRI4
SUBI4
LSHI4
ADDRLP4 144
INDIRI4
SUBI4
BCOMI4
CVIU4 4
BANDU4
ASGNU4
line 2198
;2198:      IPRhigh |= ((1 << (32 - mask)) - 1);
ADDRLP4 148
CNSTI4 1
ASGNI4
ADDRLP4 36
ADDRLP4 36
INDIRU4
ADDRLP4 148
INDIRI4
CNSTI4 32
ADDRLP4 32
INDIRI4
SUBI4
LSHI4
ADDRLP4 148
INDIRI4
SUBI4
CVIU4 4
BORU4
ASGNU4
line 2199
;2199:    }
line 2200
;2200:  }
ADDRGP4 $1413
JUMPV
LABELV $1412
line 2202
;2201:  else
;2202:  {
line 2203
;2203:    ADMP("^3!subnetban: ^7mask is out of range, please use 0-32 inclusive\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1449
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2204
;2204:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1402
JUMPV
LABELV $1413
line 2206
;2205:  }
;2206:  if (mask > 0)
ADDRLP4 32
INDIRI4
CNSTI4 0
LEI4 $1450
line 2207
;2207:  {
line 2208
;2208:    Q_strncpyz(cIPRlow, va("%hhu.%hhu.%hhu.%hhu", (IPRlow & (255 << 24)) >> 24, (IPRlow & (255 << 16)) >> 16, (IPRlow & (255 << 8)) >> 8, IPRlow & 255),
ADDRGP4 $1452
ARGP4
ADDRLP4 140
CNSTI4 24
ASGNI4
ADDRLP4 28
INDIRU4
CNSTI4 255
ADDRLP4 140
INDIRI4
LSHI4
CVIU4 4
BANDU4
ADDRLP4 140
INDIRI4
RSHU4
ARGU4
ADDRLP4 28
INDIRU4
CNSTU4 16711680
BANDU4
CNSTI4 16
RSHU4
ARGU4
ADDRLP4 28
INDIRU4
CNSTU4 65280
BANDU4
CNSTI4 8
RSHU4
ARGU4
ADDRLP4 28
INDIRU4
CNSTU4 255
BANDU4
ARGU4
ADDRLP4 144
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 40
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2210
;2209:        sizeof(cIPRlow));
;2210:    Q_strncpyz(cIPRhigh, va("%hhu.%hhu.%hhu.%hhu", (IPRhigh & (255 << 24)) >> 24, (IPRhigh & (255 << 16)) >> 16, (IPRhigh & (255 << 8)) >> 8, IPRhigh & 255),
ADDRGP4 $1452
ARGP4
ADDRLP4 152
CNSTI4 24
ASGNI4
ADDRLP4 36
INDIRU4
CNSTI4 255
ADDRLP4 152
INDIRI4
LSHI4
CVIU4 4
BANDU4
ADDRLP4 152
INDIRI4
RSHU4
ARGU4
ADDRLP4 36
INDIRU4
CNSTU4 16711680
BANDU4
CNSTI4 16
RSHU4
ARGU4
ADDRLP4 36
INDIRU4
CNSTU4 65280
BANDU4
CNSTI4 8
RSHU4
ARGU4
ADDRLP4 36
INDIRU4
CNSTU4 255
BANDU4
ARGU4
ADDRLP4 156
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 72
ARGP4
ADDRLP4 156
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2212
;2211:        sizeof(cIPRhigh));
;2212:  }
ADDRGP4 $1451
JUMPV
LABELV $1450
line 2214
;2213:  else
;2214:  {
line 2215
;2215:    Q_strncpyz(cIPRlow, "0.0.0.0", sizeof(cIPRlow));
ADDRLP4 40
ARGP4
ADDRGP4 $1453
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2216
;2216:    Q_strncpyz(cIPRhigh, "255.255.255.255", sizeof(cIPRhigh));
ADDRLP4 72
ARGP4
ADDRGP4 $1454
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2218
;2217:
;2218:  }
LABELV $1451
line 2220
;2219:
;2220:  AP(va("print \"^3!subnetban: ^7ban #%d for %s^7 has been updated by %s^7 "
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1459
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 136
ADDRLP4 140
INDIRP4
ASGNP4
ADDRGP4 $1460
JUMPV
LABELV $1459
ADDRLP4 136
ADDRGP4 $342
ASGNP4
LABELV $1460
ADDRGP4 $1455
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 148
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 148
INDIRI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 148
INDIRI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 152
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 152
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2224
;2221:          "%s (%s - %s)\n\"", bnum, g_admin_bans[bnum - 1]->name,
;2222:          (ent) ? G_admin_adminPrintName(ent) : "console",
;2223:          g_admin_bans[bnum - 1]->ip, cIPRlow, cIPRhigh));
;2224:  if (ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1461
line 2225
;2225:    Q_strncpyz(g_admin_bans[bnum - 1]->banner, G_admin_get_adminname(ent), sizeof(g_admin_bans[bnum - 1]->banner));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 G_admin_get_adminname
CALLP4
ASGNP4
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $1461
line 2226
;2226:  if (g_admin.string[0])
ADDRGP4 g_admin+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1465
line 2227
;2227:    admin_writeconfig();
ADDRGP4 admin_writeconfig
CALLV
pop
LABELV $1465
line 2228
;2228:  return qtrue;
CNSTI4 1
RETI4
LABELV $1402
endproc G_admin_subnetban 160 28
export G_admin_unban
proc G_admin_unban 60 16
line 2233
;2229:}
;2230:
;2231:qboolean
;2232:G_admin_unban(gentity_t *ent, int skiparg)
;2233:{
line 2238
;2234:  int bnum;
;2235:  char bs[5];
;2236:  int t;
;2237:
;2238:  t = trap_RealTime(NULL);
CNSTP4 0
ARGP4
ADDRLP4 16
ADDRGP4 trap_RealTime
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 2239
;2239:  if (G_SayArgc() < 2 + skiparg)
ADDRLP4 20
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $1469
line 2240
;2240:  {
line 2241
;2241:    ADMP("^3!unban: ^7usage: !unban [ban#]\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1471
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2242
;2242:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1468
JUMPV
LABELV $1469
line 2244
;2243:  }
;2244:  G_SayArgv(1 + skiparg, bs, sizeof(bs));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2245
;2245:  bnum = atoi(bs);
ADDRLP4 4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 2246
;2246:  if (bnum < 1 || bnum > MAX_ADMIN_BANS || !g_admin_bans[bnum - 1])
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $1476
ADDRLP4 0
INDIRI4
CNSTI4 1024
GTI4 $1476
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1472
LABELV $1476
line 2247
;2247:  {
line 2248
;2248:    ADMP("^3!unban: ^7invalid ban#\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1477
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2249
;2249:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1468
JUMPV
LABELV $1472
line 2251
;2250:  }
;2251:  if (g_admin_bans[bnum - 1]->expires == 0 && !G_admin_permission(ent, ADMF_CAN_PERM_BAN))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1478
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1197
ARGP4
ADDRLP4 32
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $1478
line 2252
;2252:  {
line 2253
;2253:    ADMP("^3!unban: ^7you cannot remove permanent bans\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1481
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2254
;2254:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1468
JUMPV
LABELV $1478
line 2256
;2255:  }
;2256:  if (g_adminMaxBan.integer && !G_admin_permission(ent, ADMF_CAN_PERM_BAN) && g_admin_bans[bnum - 1]->expires - t > G_admin_parse_time(g_adminMaxBan.string))
ADDRGP4 g_adminMaxBan+12
INDIRI4
CNSTI4 0
EQI4 $1482
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1197
ARGP4
ADDRLP4 36
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $1482
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 40
ADDRGP4 G_admin_parse_time
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ADDRLP4 40
INDIRI4
LEI4 $1482
line 2257
;2257:  {
line 2258
;2258:    ADMP(va("^3!unban: ^7your admin level cannot remove bans longer than %s\n",
ADDRGP4 $1487
ARGP4
ADDRGP4 g_adminMaxBan+16
ARGP4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2260
;2259:            g_adminMaxBan.string));
;2260:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1468
JUMPV
LABELV $1482
line 2262
;2261:  }
;2262:  g_admin_bans[bnum - 1]->expires = t;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 2263
;2263:  AP(va("print \"^3!unban: ^7ban #%d for %s^7 has been removed by %s\n\"",
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1493
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 44
ADDRLP4 48
INDIRP4
ASGNP4
ADDRGP4 $1494
JUMPV
LABELV $1493
ADDRLP4 44
ADDRGP4 $342
ASGNP4
LABELV $1494
ADDRGP4 $1490
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans-4
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2266
;2264:          bnum, g_admin_bans[bnum - 1]->name, (ent) ? G_admin_adminPrintName(ent)
;2265:          : "console"));
;2266:  if (g_admin.string[0])
ADDRGP4 g_admin+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1495
line 2267
;2267:    admin_writeconfig();
ADDRGP4 admin_writeconfig
CALLV
pop
LABELV $1495
line 2268
;2268:  return qtrue;
CNSTI4 1
RETI4
LABELV $1468
endproc G_admin_unban 60 16
lit
align 1
LABELV $1499
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 0
skip 21
export G_admin_putteam
code
proc G_admin_putteam 1400 16
line 2273
;2269:}
;2270:
;2271:qboolean
;2272:G_admin_putteam(gentity_t *ent, int skiparg)
;2273:{
line 2277
;2274:  int pids[MAX_CLIENTS];
;2275:  char name[MAX_NAME_LENGTH], team[7], err[MAX_STRING_CHARS];
;2276:  gentity_t *vic;
;2277:  pTeam_t teamnum = PTE_NONE;
ADDRLP4 260
CNSTI4 0
ASGNI4
line 2279
;2278:  char teamdesc[32] =
;2279:  { "spectators" };
ADDRLP4 303
ADDRGP4 $1499
INDIRB
ASGNB 32
line 2281
;2280:
;2281:  G_SayArgv(1 + skiparg, name, sizeof(name));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 271
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2282
;2282:  G_SayArgv(2 + skiparg, team, sizeof(team));
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 264
ARGP4
CNSTI4 7
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2283
;2283:  if (G_SayArgc() < 3 + skiparg)
ADDRLP4 1360
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 1360
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
GEI4 $1500
line 2284
;2284:  {
line 2285
;2285:    ADMP("^3!putteam: ^7usage: !putteam [name] [h|a|s]\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1502
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2286
;2286:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1498
JUMPV
LABELV $1500
line 2289
;2287:  }
;2288:
;2289:  if (G_ClientNumbersFromString(name, pids) != 1)
ADDRLP4 271
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1364
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 1364
INDIRI4
CNSTI4 1
EQI4 $1503
line 2290
;2290:  {
line 2291
;2291:    G_MatchOnePlayer(pids, err, sizeof(err));
ADDRLP4 4
ARGP4
ADDRLP4 335
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLI4
pop
line 2292
;2292:    ADMP(va("^3!putteam: ^7%s\n", err));
ADDRGP4 $1505
ARGP4
ADDRLP4 335
ARGP4
ADDRLP4 1368
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1368
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2293
;2293:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1498
JUMPV
LABELV $1503
line 2295
;2294:  }
;2295:  if (!admin_higher(ent, &g_entities[pids[0]]))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1368
ADDRGP4 admin_higher
CALLI4
ASGNI4
ADDRLP4 1368
INDIRI4
CNSTI4 0
NEI4 $1506
line 2296
;2296:  {
line 2297
;2297:    ADMP("^3!putteam: ^7sorry, but your intended victim has a higher "
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1508
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2299
;2298:        " admin level than you\n");
;2299:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1498
JUMPV
LABELV $1506
line 2301
;2300:  }
;2301:  vic = &g_entities[pids[0]];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2302
;2302:  switch(team[0])
ADDRLP4 1372
ADDRLP4 264
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1380
CNSTI4 104
ASGNI4
ADDRLP4 1372
INDIRI4
ADDRLP4 1380
INDIRI4
EQI4 $1514
ADDRLP4 1372
INDIRI4
ADDRLP4 1380
INDIRI4
GTI4 $1519
LABELV $1518
ADDRLP4 1372
INDIRI4
CNSTI4 97
EQI4 $1512
ADDRGP4 $1509
JUMPV
LABELV $1519
ADDRLP4 1372
INDIRI4
CNSTI4 115
EQI4 $1516
ADDRGP4 $1509
JUMPV
line 2303
;2303:  {
LABELV $1512
line 2305
;2304:    case 'a':
;2305:      teamnum = PTE_ALIENS;
ADDRLP4 260
CNSTI4 1
ASGNI4
line 2306
;2306:      Q_strncpyz(teamdesc, "aliens", sizeof(teamdesc));
ADDRLP4 303
ARGP4
ADDRGP4 $1513
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2307
;2307:      break;
ADDRGP4 $1510
JUMPV
LABELV $1514
line 2309
;2308:    case 'h':
;2309:      teamnum = PTE_HUMANS;
ADDRLP4 260
CNSTI4 2
ASGNI4
line 2310
;2310:      Q_strncpyz(teamdesc, "humans", sizeof(teamdesc));
ADDRLP4 303
ARGP4
ADDRGP4 $1515
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2311
;2311:      break;
ADDRGP4 $1510
JUMPV
LABELV $1516
line 2313
;2312:    case 's':
;2313:      teamnum = PTE_NONE;
ADDRLP4 260
CNSTI4 0
ASGNI4
line 2314
;2314:      break;
ADDRGP4 $1510
JUMPV
LABELV $1509
line 2316
;2315:    default:
;2316:      ADMP(va("^3!putteam: ^7unknown team %c\n", team[0]));
ADDRGP4 $1517
ARGP4
ADDRLP4 264
INDIRI1
CVII4 1
ARGI4
ADDRLP4 1384
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1384
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2317
;2317:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1498
JUMPV
LABELV $1510
line 2319
;2318:  }
;2319:  if (vic->client->pers.teamSelection == teamnum)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRLP4 260
INDIRI4
NEI4 $1520
line 2320
;2320:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1498
JUMPV
LABELV $1520
line 2321
;2321:  G_ChangeTeam(vic, teamnum);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 260
INDIRI4
ARGI4
ADDRGP4 G_ChangeTeam
CALLV
pop
line 2323
;2322:
;2323:  AP(va("print \"^3!putteam: ^7%s^7 put %s^7 on to the %s team\n\"",
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1524
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1388
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 1384
ADDRLP4 1388
INDIRP4
ASGNP4
ADDRGP4 $1525
JUMPV
LABELV $1524
ADDRLP4 1384
ADDRGP4 $342
ASGNP4
LABELV $1525
ADDRGP4 $1522
ARGP4
ADDRLP4 1384
INDIRP4
ARGP4
ADDRLP4 1392
CNSTI4 516
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 1392
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1392
INDIRI4
ADDP4
ARGP4
ADDRLP4 303
ARGP4
ADDRLP4 1396
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1396
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2326
;2324:          (ent) ? G_admin_adminPrintName(ent) : "console",
;2325:          vic->client->pers.netname, teamdesc));
;2326:  return qtrue;
CNSTI4 1
RETI4
LABELV $1498
endproc G_admin_putteam 1400 16
lit
align 1
LABELV $1527
byte 1 0
skip 63
export G_admin_map
code
proc G_admin_map 168 16
line 2331
;2327:}
;2328:
;2329:qboolean
;2330:G_admin_map(gentity_t *ent, int skiparg)
;2331:{
line 2334
;2332:  char map[MAX_QPATH];
;2333:  char layout[MAX_QPATH] =
;2334:  { "" };
ADDRLP4 64
ADDRGP4 $1527
INDIRB
ASGNB 64
line 2336
;2335:
;2336:  if (G_SayArgc() < 2 + skiparg)
ADDRLP4 128
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $1528
line 2337
;2337:  {
line 2338
;2338:    ADMP("^3!map: ^7usage: !map [map] (layout)\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1530
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2339
;2339:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1526
JUMPV
LABELV $1528
line 2342
;2340:  }
;2341:
;2342:  G_SayArgv(skiparg + 1, map, sizeof(map));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2344
;2343:
;2344:  if (!trap_FS_FOpenFile(va("maps/%s.bsp", map), NULL, FS_READ))
ADDRGP4 $1533
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 132
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 132
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 136
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
NEI4 $1531
line 2345
;2345:  {
line 2346
;2346:    ADMP(va("^3!map: ^7invalid map name '%s'\n", map));
ADDRGP4 $1534
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2347
;2347:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1526
JUMPV
LABELV $1531
line 2350
;2348:  }
;2349:
;2350:  if (G_SayArgc() > 2 + skiparg)
ADDRLP4 140
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
LEI4 $1535
line 2351
;2351:  {
line 2352
;2352:    G_SayArgv(skiparg + 2, layout, sizeof(layout));
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 64
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2353
;2353:    if (!Q_stricmp(layout, "*BUILTIN*") || trap_FS_FOpenFile(va("layouts/%s/%s.dat", map, layout), NULL, FS_READ) > 0)
ADDRLP4 64
ARGP4
ADDRGP4 $1539
ARGP4
ADDRLP4 144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1541
ADDRGP4 $1540
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 148
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 148
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 152
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
LEI4 $1537
LABELV $1541
line 2354
;2354:    {
line 2355
;2355:      trap_Cvar_Set("g_layouts", layout);
ADDRGP4 $1542
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2356
;2356:    }
ADDRGP4 $1538
JUMPV
LABELV $1537
line 2358
;2357:    else
;2358:    {
line 2359
;2359:      ADMP(va("^3!map: ^7invalid layout name '%s'\n", layout));
ADDRGP4 $1543
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 156
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2360
;2360:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1526
JUMPV
LABELV $1538
line 2362
;2361:    }
;2362:  }
LABELV $1535
line 2364
;2363:
;2364:  trap_SendConsoleCommand(EXEC_APPEND, va("map %s", map));
ADDRGP4 $1544
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 144
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2365
;2365:  level.restarted = qtrue;
ADDRGP4 level+173936
CNSTI4 1
ASGNI4
line 2366
;2366:  AP(va("print \"^3!map: ^7map '%s' started by %s^7 %s\n\"", map,
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1550
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 148
ADDRLP4 156
INDIRP4
ASGNP4
ADDRGP4 $1551
JUMPV
LABELV $1550
ADDRLP4 148
ADDRGP4 $342
ASGNP4
LABELV $1551
ADDRLP4 64
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1552
ADDRGP4 $1548
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 160
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 152
ADDRLP4 160
INDIRP4
ASGNP4
ADDRGP4 $1553
JUMPV
LABELV $1552
ADDRLP4 152
ADDRGP4 $93
ASGNP4
LABELV $1553
ADDRGP4 $1546
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 164
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2369
;2367:          (ent) ? G_admin_adminPrintName(ent) : "console", (layout[0]) ? va(
;2368:              "(forcing layout '%s')", layout) : ""));
;2369:  G_admin_maplog_result("M");
ADDRGP4 $1554
ARGP4
ADDRGP4 G_admin_maplog_result
CALLV
pop
line 2370
;2370:  return qtrue;
CNSTI4 1
RETI4
LABELV $1526
endproc G_admin_map 168 16
lit
align 1
LABELV $1556
byte 1 0
skip 63
export G_admin_devmap
code
proc G_admin_devmap 168 16
line 2375
;2371:}
;2372:
;2373:qboolean
;2374:G_admin_devmap(gentity_t *ent, int skiparg)
;2375:{
line 2378
;2376:  char map[MAX_QPATH];
;2377:  char layout[MAX_QPATH] =
;2378:  { "" };
ADDRLP4 64
ADDRGP4 $1556
INDIRB
ASGNB 64
line 2380
;2379:
;2380:  if (G_SayArgc() < 2 + skiparg)
ADDRLP4 128
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $1557
line 2381
;2381:  {
line 2382
;2382:    ADMP("^3!devmap: ^7usage: !devmap [map] (layout)\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1559
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2383
;2383:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1555
JUMPV
LABELV $1557
line 2386
;2384:  }
;2385:
;2386:  G_SayArgv(skiparg + 1, map, sizeof(map));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2388
;2387:
;2388:  if (!trap_FS_FOpenFile(va("maps/%s.bsp", map), NULL, FS_READ))
ADDRGP4 $1533
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 132
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 132
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 136
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
NEI4 $1560
line 2389
;2389:  {
line 2390
;2390:    ADMP(va("^3!devmap: ^7invalid map name '%s'\n", map));
ADDRGP4 $1562
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2391
;2391:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1555
JUMPV
LABELV $1560
line 2394
;2392:  }
;2393:
;2394:  if (G_SayArgc() > 2 + skiparg)
ADDRLP4 140
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
LEI4 $1563
line 2395
;2395:  {
line 2396
;2396:    G_SayArgv(skiparg + 2, layout, sizeof(layout));
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 64
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2397
;2397:    if (!Q_stricmp(layout, "*BUILTIN*") || trap_FS_FOpenFile(va("layouts/%s/%s.dat", map, layout), NULL, FS_READ) > 0)
ADDRLP4 64
ARGP4
ADDRGP4 $1539
ARGP4
ADDRLP4 144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1567
ADDRGP4 $1540
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 148
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 148
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 152
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
LEI4 $1565
LABELV $1567
line 2398
;2398:    {
line 2399
;2399:      trap_Cvar_Set("g_layouts", layout);
ADDRGP4 $1542
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2400
;2400:    }
ADDRGP4 $1566
JUMPV
LABELV $1565
line 2402
;2401:    else
;2402:    {
line 2403
;2403:      ADMP(va("^3!devmap: ^7invalid layout name '%s'\n", layout));
ADDRGP4 $1568
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 156
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2404
;2404:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1555
JUMPV
LABELV $1566
line 2406
;2405:    }
;2406:  }
LABELV $1563
line 2408
;2407:
;2408:  trap_SendConsoleCommand(EXEC_APPEND, va("devmap %s", map));
ADDRGP4 $1569
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 144
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2409
;2409:  level.restarted = qtrue;
ADDRGP4 level+173936
CNSTI4 1
ASGNI4
line 2410
;2410:  AP(va("print \"^3!devmap: ^7map '%s' started by %s^7 with cheats %s\n\"",
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1574
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 148
ADDRLP4 156
INDIRP4
ASGNP4
ADDRGP4 $1575
JUMPV
LABELV $1574
ADDRLP4 148
ADDRGP4 $342
ASGNP4
LABELV $1575
ADDRLP4 64
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1576
ADDRGP4 $1548
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 160
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 152
ADDRLP4 160
INDIRP4
ASGNP4
ADDRGP4 $1577
JUMPV
LABELV $1576
ADDRLP4 152
ADDRGP4 $93
ASGNP4
LABELV $1577
ADDRGP4 $1571
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 152
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 164
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2413
;2411:          map, (ent) ? G_admin_adminPrintName(ent) : "console", (layout[0]) ? va(
;2412:              "(forcing layout '%s')", layout) : ""));
;2413:  G_admin_maplog_result("D");
ADDRGP4 $1578
ARGP4
ADDRGP4 G_admin_maplog_result
CALLV
pop
line 2414
;2414:  return qtrue;
CNSTI4 1
RETI4
LABELV $1555
endproc G_admin_devmap 168 16
export G_admin_maplog_update
proc G_admin_maplog_update 336 16
line 2419
;2415:}
;2416:
;2417:void
;2418:G_admin_maplog_update(void)
;2419:{
line 2423
;2420:  char map[64];
;2421:  char maplog[MAX_CVAR_VALUE_STRING];
;2422:  char *ptr;
;2423:  int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2425
;2424:
;2425:  trap_Cvar_VariableStringBuffer("mapname", map, sizeof(map));
ADDRGP4 $1580
ARGP4
ADDRLP4 264
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 2427
;2426:
;2427:  Q_strncpyz(maplog, g_adminMapLog.string, sizeof(maplog));
ADDRLP4 8
ARGP4
ADDRGP4 g_adminMapLog+16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2428
;2428:  ptr = maplog;
ADDRLP4 0
ADDRLP4 8
ASGNP4
ADDRGP4 $1583
JUMPV
line 2430
;2429:  while(*ptr && count < MAX_ADMIN_MAPLOG_LENGTH)
;2430:  {
LABELV $1585
line 2432
;2431:    while(*ptr != ' ' && *ptr != '\0')
;2432:      ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $1586
line 2431
ADDRLP4 328
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 32
EQI4 $1588
ADDRLP4 328
INDIRI4
CNSTI4 0
NEI4 $1585
LABELV $1588
line 2434
;2433:
;2434:    count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2435
;2435:    if (count >= MAX_ADMIN_MAPLOG_LENGTH)
ADDRLP4 4
INDIRI4
CNSTI4 5
LTI4 $1589
line 2436
;2436:    {
line 2437
;2437:      *ptr = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 2438
;2438:    }
LABELV $1589
line 2440
;2439:
;2440:    if (*ptr == ' ')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $1591
line 2441
;2441:      ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $1591
line 2442
;2442:  }
LABELV $1583
line 2429
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1593
ADDRLP4 4
INDIRI4
CNSTI4 5
LTI4 $1586
LABELV $1593
line 2444
;2443:
;2444:  trap_Cvar_Set("g_adminMapLog", va("%s%s%s", map, (maplog[0] != '\0') ? " " : "", maplog));
ADDRGP4 $1595
ARGP4
ADDRLP4 264
ARGP4
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1597
ADDRLP4 328
ADDRGP4 $486
ASGNP4
ADDRGP4 $1598
JUMPV
LABELV $1597
ADDRLP4 328
ADDRGP4 $93
ASGNP4
LABELV $1598
ADDRLP4 328
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 332
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1594
ARGP4
ADDRLP4 332
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2445
;2445:}
LABELV $1579
endproc G_admin_maplog_update 336 16
data
align 4
LABELV $1600
byte 4 0
export G_admin_maplog_result
code
proc G_admin_maplog_result 272 20
line 2449
;2446:
;2447:void
;2448:G_admin_maplog_result(char *flag)
;2449:{
line 2454
;2450:  static int lastTime = 0;
;2451:  char maplog[MAX_CVAR_VALUE_STRING];
;2452:  int t;
;2453:
;2454:  if (!flag)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1601
line 2455
;2455:    return;
ADDRGP4 $1599
JUMPV
LABELV $1601
line 2458
;2456:
;2457:  // avoid race when called in same frame
;2458:  if (level.time == lastTime)
ADDRGP4 level+28
INDIRI4
ADDRGP4 $1600
INDIRI4
NEI4 $1603
line 2459
;2459:    return;
ADDRGP4 $1599
JUMPV
LABELV $1603
line 2461
;2460:
;2461:  lastTime = level.time;
ADDRGP4 $1600
ADDRGP4 level+28
INDIRI4
ASGNI4
line 2463
;2462:
;2463:  if (g_adminMapLog.string[0] && g_adminMapLog.string[1] == ';')
ADDRGP4 g_adminMapLog+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1607
ADDRGP4 g_adminMapLog+16+1
INDIRI1
CVII4 1
CNSTI4 59
NEI4 $1607
line 2464
;2464:  {
line 2466
;2465:    // only one result allowed
;2466:    return;
ADDRGP4 $1599
JUMPV
LABELV $1607
line 2469
;2467:  }
;2468:
;2469:  if (level.surrenderTeam != PTE_NONE)
ADDRGP4 level+189968
INDIRI4
CNSTI4 0
EQI4 $1612
line 2470
;2470:  {
line 2471
;2471:    if (flag[0] == 'a')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 97
NEI4 $1615
line 2472
;2472:    {
line 2473
;2473:      if (level.surrenderTeam == PTE_HUMANS)
ADDRGP4 level+189968
INDIRI4
CNSTI4 2
NEI4 $1616
line 2474
;2474:        flag = "A";
ADDRFP4 0
ADDRGP4 $1620
ASGNP4
line 2475
;2475:    }
ADDRGP4 $1616
JUMPV
LABELV $1615
line 2476
;2476:    else if (flag[0] == 'h')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 104
NEI4 $1621
line 2477
;2477:    {
line 2478
;2478:      if (level.surrenderTeam == PTE_ALIENS)
ADDRGP4 level+189968
INDIRI4
CNSTI4 1
NEI4 $1623
line 2479
;2479:        flag = "H";
ADDRFP4 0
ADDRGP4 $1626
ASGNP4
LABELV $1623
line 2480
;2480:    }
LABELV $1621
LABELV $1616
line 2481
;2481:  }
LABELV $1612
line 2483
;2482:
;2483:  t = (level.time - level.startTime) / 1000;
ADDRLP4 256
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 2484
;2484:  Q_strncpyz(maplog, g_adminMapLog.string, sizeof(maplog));
ADDRLP4 0
ARGP4
ADDRGP4 g_adminMapLog+16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2485
;2485:  trap_Cvar_Set("g_adminMapLog", va("%1s;%03d:%02d;%s", flag, t / 60, t % 60, maplog));
ADDRGP4 $1630
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 264
CNSTI4 60
ASGNI4
ADDRLP4 256
INDIRI4
ADDRLP4 264
INDIRI4
DIVI4
ARGI4
ADDRLP4 256
INDIRI4
ADDRLP4 264
INDIRI4
MODI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $1594
ARGP4
ADDRLP4 268
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2486
;2486:}
LABELV $1599
endproc G_admin_maplog_result 272 20
export G_admin_maplog
proc G_admin_maplog 340 20
line 2490
;2487:
;2488:qboolean
;2489:G_admin_maplog(gentity_t *ent, int skiparg)
;2490:{
line 2493
;2491:  char maplog[MAX_CVAR_VALUE_STRING];
;2492:  char *ptr;
;2493:  int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2495
;2494:
;2495:  Q_strncpyz(maplog, g_adminMapLog.string, sizeof(maplog));
ADDRLP4 8
ARGP4
ADDRGP4 g_adminMapLog+16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2497
;2496:
;2497:  ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 2498
;2498:  ptr = maplog;
ADDRLP4 0
ADDRLP4 8
ASGNP4
ADDRGP4 $1634
JUMPV
LABELV $1633
line 2500
;2499:  while(*ptr != '\0' && count < MAX_ADMIN_MAPLOG_LENGTH + 1)
;2500:  {
line 2502
;2501:    char *end;
;2502:    const char *result = NULL;
ADDRLP4 272
CNSTP4 0
ASGNP4
line 2503
;2503:    char *clock = NULL;
ADDRLP4 268
CNSTP4 0
ASGNP4
line 2506
;2504:    char *colon;
;2505:
;2506:    end = ptr;
ADDRLP4 264
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $1637
JUMPV
LABELV $1636
line 2508
;2507:    while(*end != ' ' && *end != '\0')
;2508:      end++;
ADDRLP4 264
ADDRLP4 264
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $1637
line 2507
ADDRLP4 280
ADDRLP4 264
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 32
EQI4 $1639
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $1636
LABELV $1639
line 2509
;2509:    if (*end == ' ')
ADDRLP4 264
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $1640
line 2510
;2510:    {
line 2511
;2511:      *end = '\0';
ADDRLP4 264
INDIRP4
CNSTI1 0
ASGNI1
line 2512
;2512:      end++;
ADDRLP4 264
ADDRLP4 264
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2513
;2513:    }
LABELV $1640
line 2515
;2514:
;2515:    if (ptr[0] && ptr[1] == ';')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1642
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 59
NEI4 $1642
line 2516
;2516:    {
line 2517
;2517:      switch(ptr[0])
ADDRLP4 288
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 97
EQI4 $1649
ADDRLP4 296
CNSTI4 100
ASGNI4
ADDRLP4 288
INDIRI4
ADDRLP4 296
INDIRI4
EQI4 $1657
ADDRLP4 288
INDIRI4
ADDRLP4 296
INDIRI4
GTI4 $1672
LABELV $1671
ADDRLP4 304
CNSTI4 72
ASGNI4
ADDRLP4 288
INDIRI4
ADDRLP4 304
INDIRI4
EQI4 $1655
ADDRLP4 288
INDIRI4
ADDRLP4 304
INDIRI4
GTI4 $1674
LABELV $1673
ADDRLP4 288
INDIRI4
CNSTI4 65
EQI4 $1651
ADDRLP4 288
INDIRI4
CNSTI4 68
EQI4 $1669
ADDRGP4 $1644
JUMPV
LABELV $1674
ADDRLP4 288
INDIRI4
CNSTI4 77
EQI4 $1667
ADDRLP4 288
INDIRI4
CNSTI4 78
EQI4 $1659
ADDRLP4 288
INDIRI4
CNSTI4 82
EQI4 $1663
ADDRGP4 $1644
JUMPV
LABELV $1672
ADDRLP4 320
CNSTI4 109
ASGNI4
ADDRLP4 288
INDIRI4
ADDRLP4 320
INDIRI4
EQI4 $1665
ADDRLP4 288
INDIRI4
ADDRLP4 320
INDIRI4
GTI4 $1676
LABELV $1675
ADDRLP4 288
INDIRI4
CNSTI4 104
EQI4 $1653
ADDRGP4 $1644
JUMPV
LABELV $1676
ADDRLP4 288
INDIRI4
CNSTI4 114
EQI4 $1661
ADDRLP4 288
INDIRI4
CNSTI4 116
EQI4 $1647
ADDRGP4 $1644
JUMPV
line 2518
;2518:      {
LABELV $1647
line 2520
;2519:        case 't':
;2520:          result = "^7tie";
ADDRLP4 272
ADDRGP4 $1648
ASGNP4
line 2521
;2521:          break;
ADDRGP4 $1645
JUMPV
LABELV $1649
line 2523
;2522:        case 'a':
;2523:          result = "^1Alien win";
ADDRLP4 272
ADDRGP4 $1650
ASGNP4
line 2524
;2524:          break;
ADDRGP4 $1645
JUMPV
LABELV $1651
line 2526
;2525:        case 'A':
;2526:          result = "^1Alien win ^7/ Humans admitted defeat";
ADDRLP4 272
ADDRGP4 $1652
ASGNP4
line 2527
;2527:          break;
ADDRGP4 $1645
JUMPV
LABELV $1653
line 2529
;2528:        case 'h':
;2529:          result = "^4Human win";
ADDRLP4 272
ADDRGP4 $1654
ASGNP4
line 2530
;2530:          break;
ADDRGP4 $1645
JUMPV
LABELV $1655
line 2532
;2531:        case 'H':
;2532:          result = "^4Human win ^7/ Aliens admitted defeat";
ADDRLP4 272
ADDRGP4 $1656
ASGNP4
line 2533
;2533:          break;
ADDRGP4 $1645
JUMPV
LABELV $1657
line 2535
;2534:        case 'd':
;2535:          result = "^5draw vote";
ADDRLP4 272
ADDRGP4 $1658
ASGNP4
line 2536
;2536:          break;
ADDRGP4 $1645
JUMPV
LABELV $1659
line 2538
;2537:        case 'N':
;2538:          result = "^6admin loaded next map";
ADDRLP4 272
ADDRGP4 $1660
ASGNP4
line 2539
;2539:          break;
ADDRGP4 $1645
JUMPV
LABELV $1661
line 2541
;2540:        case 'r':
;2541:          result = "^2restart vote";
ADDRLP4 272
ADDRGP4 $1662
ASGNP4
line 2542
;2542:          break;
ADDRGP4 $1645
JUMPV
LABELV $1663
line 2544
;2543:        case 'R':
;2544:          result = "^6admin restarted map";
ADDRLP4 272
ADDRGP4 $1664
ASGNP4
line 2545
;2545:          break;
ADDRGP4 $1645
JUMPV
LABELV $1665
line 2547
;2546:        case 'm':
;2547:          result = "^2map vote";
ADDRLP4 272
ADDRGP4 $1666
ASGNP4
line 2548
;2548:          break;
ADDRGP4 $1645
JUMPV
LABELV $1667
line 2550
;2549:        case 'M':
;2550:          result = "^6admin changed map";
ADDRLP4 272
ADDRGP4 $1668
ASGNP4
line 2551
;2551:          break;
ADDRGP4 $1645
JUMPV
LABELV $1669
line 2553
;2552:        case 'D':
;2553:          result = "^6admin loaded devmap";
ADDRLP4 272
ADDRGP4 $1670
ASGNP4
line 2554
;2554:          break;
ADDRGP4 $1645
JUMPV
LABELV $1644
line 2556
;2555:        default:
;2556:          result = "";
ADDRLP4 272
ADDRGP4 $93
ASGNP4
line 2557
;2557:          break;
LABELV $1645
line 2559
;2558:      }
;2559:      ptr += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 2560
;2560:      colon = strchr(ptr, ';');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 328
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 276
ADDRLP4 328
INDIRP4
ASGNP4
line 2561
;2561:      if (colon)
ADDRLP4 276
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1643
line 2562
;2562:      {
line 2563
;2563:        clock = ptr;
ADDRLP4 268
ADDRLP4 0
INDIRP4
ASGNP4
line 2564
;2564:        ptr = colon + 1;
ADDRLP4 0
ADDRLP4 276
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2565
;2565:        *colon = '\0';
ADDRLP4 276
INDIRP4
CNSTI1 0
ASGNI1
line 2568
;2566:
;2567:        // right justification with -6%s doesnt work..
;2568:        if (clock[0] == '0' && clock[1] != ':')
ADDRLP4 268
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
NEI4 $1643
ADDRLP4 268
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 58
EQI4 $1643
line 2569
;2569:        {
line 2570
;2570:          if (clock[1] == '0' && clock[2] != ':')
ADDRLP4 268
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
NEI4 $1681
ADDRLP4 268
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 58
EQI4 $1681
line 2571
;2571:            clock[1] = ' ';
ADDRLP4 268
INDIRP4
CNSTI4 1
ADDP4
CNSTI1 32
ASGNI1
LABELV $1681
line 2572
;2572:          clock[0] = ' ';
ADDRLP4 268
INDIRP4
CNSTI1 32
ASGNI1
line 2573
;2573:        }
line 2574
;2574:      }
line 2575
;2575:    }
ADDRGP4 $1643
JUMPV
LABELV $1642
line 2576
;2576:    else if (count == 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1683
line 2577
;2577:    {
line 2578
;2578:      result = "^3current map";
ADDRLP4 272
ADDRGP4 $1685
ASGNP4
line 2579
;2579:      clock = "  -:--";
ADDRLP4 268
ADDRGP4 $1686
ASGNP4
line 2580
;2580:    }
LABELV $1683
LABELV $1643
line 2582
;2581:
;2582:    ADMBP(va("%s%20s %-6s %s^7\n", (count == 0) ? "^3" : "^7", ptr,
ADDRGP4 $1687
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1692
ADDRLP4 288
ADDRGP4 $1275
ASGNP4
ADDRGP4 $1693
JUMPV
LABELV $1692
ADDRLP4 288
ADDRGP4 $1688
ASGNP4
LABELV $1693
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 268
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1694
ADDRLP4 292
ADDRLP4 268
INDIRP4
ASGNP4
ADDRGP4 $1695
JUMPV
LABELV $1694
ADDRLP4 292
ADDRGP4 $93
ASGNP4
LABELV $1695
ADDRLP4 292
INDIRP4
ARGP4
ADDRLP4 272
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1696
ADDRLP4 296
ADDRLP4 272
INDIRP4
ASGNP4
ADDRGP4 $1697
JUMPV
LABELV $1696
ADDRLP4 296
ADDRGP4 $93
ASGNP4
LABELV $1697
ADDRLP4 296
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 300
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2585
;2583:            (clock) ? clock : "", (result) ? result : ""));
;2584:
;2585:    ptr = end;
ADDRLP4 0
ADDRLP4 264
INDIRP4
ASGNP4
line 2586
;2586:    count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2587
;2587:  }
LABELV $1634
line 2499
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1698
ADDRLP4 4
INDIRI4
CNSTI4 6
LTI4 $1633
LABELV $1698
line 2588
;2588:  ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 2590
;2589:
;2590:  return qtrue;
CNSTI4 1
RETI4
LABELV $1631
endproc G_admin_maplog 340 20
export G_admin_layoutsave
proc G_admin_layoutsave 84 12
line 2595
;2591:}
;2592:
;2593:qboolean
;2594:G_admin_layoutsave(gentity_t *ent, int skiparg)
;2595:{
line 2598
;2596:  char layout[MAX_QPATH];
;2597:
;2598:  if(g_survival.integer)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $1700
line 2599
;2599:  {
line 2600
;2600:    ADMP("^3!layoutsave: Cannot Save Layout in Survival Mode.\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1703
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2601
;2601:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1699
JUMPV
LABELV $1700
line 2603
;2602:  }
;2603:  if (G_SayArgc() < 2 + skiparg)
ADDRLP4 64
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $1704
line 2604
;2604:  {
line 2605
;2605:    ADMP("^3!layoutsave: ^7usage: !layoutsave [layout]\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1706
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2606
;2606:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1699
JUMPV
LABELV $1704
line 2609
;2607:  }
;2608:
;2609:  G_SayArgv(skiparg + 1, layout, sizeof(layout));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2611
;2610:
;2611:  trap_SendConsoleCommand(EXEC_APPEND, va("layoutsave %s", layout));
ADDRGP4 $1707
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 2612
;2612:  AP(va("print \"^3!layoutsave: ^7layout saved as '%s' by %s\n\"", layout,
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1710
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 76
INDIRP4
ASGNP4
ADDRGP4 $1711
JUMPV
LABELV $1710
ADDRLP4 72
ADDRGP4 $342
ASGNP4
LABELV $1711
ADDRGP4 $1708
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2614
;2613:          (ent) ? G_admin_adminPrintName(ent) : "console"));
;2614:  return qtrue;
CNSTI4 1
RETI4
LABELV $1699
endproc G_admin_layoutsave 84 12
export G_admin_mute
proc G_admin_mute 1376 12
line 2619
;2615:}
;2616:
;2617:qboolean
;2618:G_admin_mute(gentity_t *ent, int skiparg)
;2619:{
line 2625
;2620:  int pids[MAX_CLIENTS];
;2621:  char name[MAX_NAME_LENGTH], err[MAX_STRING_CHARS];
;2622:  char command[MAX_ADMIN_CMD_LEN], *cmd;
;2623:  gentity_t *vic;
;2624:
;2625:  G_SayArgv(skiparg, command, sizeof(command));
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 296
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2626
;2626:  cmd = command;
ADDRLP4 0
ADDRLP4 296
ASGNP4
line 2627
;2627:  if (cmd && *cmd == '!')
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1713
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 33
NEI4 $1713
line 2628
;2628:    cmd++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $1713
line 2629
;2629:  if (G_SayArgc() < 2 + skiparg)
ADDRLP4 1344
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 1344
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $1715
line 2630
;2630:  {
line 2631
;2631:    ADMP(va("^3!%s: ^7usage: !%s [name|slot#]\n", cmd, cmd));
ADDRGP4 $1717
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1352
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1352
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2632
;2632:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1712
JUMPV
LABELV $1715
line 2634
;2633:  }
;2634:  G_SayArgv(1 + skiparg, name, sizeof(name));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 264
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2635
;2635:  if (G_ClientNumbersFromString(name, pids) != 1)
ADDRLP4 264
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1348
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 1348
INDIRI4
CNSTI4 1
EQI4 $1718
line 2636
;2636:  {
line 2637
;2637:    G_MatchOnePlayer(pids, err, sizeof(err));
ADDRLP4 4
ARGP4
ADDRLP4 316
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLI4
pop
line 2638
;2638:    ADMP(va("^3!%s: ^7%s\n", cmd, err));
ADDRGP4 $1720
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 316
ARGP4
ADDRLP4 1352
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1352
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2639
;2639:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1712
JUMPV
LABELV $1718
line 2641
;2640:  }
;2641:  if (!admin_higher(ent, &g_entities[pids[0]]))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1352
ADDRGP4 admin_higher
CALLI4
ASGNI4
ADDRLP4 1352
INDIRI4
CNSTI4 0
NEI4 $1721
line 2642
;2642:  {
line 2643
;2643:    ADMP(va("^3!%s: ^7sorry, but your intended victim has a higher admin"
ADDRGP4 $1723
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1356
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1356
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2645
;2644:            " level than you\n", cmd));
;2645:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1712
JUMPV
LABELV $1721
line 2647
;2646:  }
;2647:  vic = &g_entities[pids[0]];
ADDRLP4 260
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2648
;2648:  if (vic->client->pers.muted == qtrue)
ADDRLP4 260
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1724
line 2649
;2649:  {
line 2650
;2650:    if (!Q_stricmp(cmd, "mute"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $171
ARGP4
ADDRLP4 1356
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1356
INDIRI4
CNSTI4 0
NEI4 $1726
line 2651
;2651:    {
line 2652
;2652:      ADMP("^3!mute: ^7player is already muted\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1728
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2653
;2653:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1712
JUMPV
LABELV $1726
line 2655
;2654:    }
;2655:    vic->client->pers.muted = qfalse;
ADDRLP4 260
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 0
ASGNI4
line 2656
;2656:    CPx(pids[0], "cp \"^1You have been unmuted\"");
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $1729
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2657
;2657:    AP(va("print \"^3!unmute: ^7%s^7 has been unmuted by %s\n\"",
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1732
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1364
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 1360
ADDRLP4 1364
INDIRP4
ASGNP4
ADDRGP4 $1733
JUMPV
LABELV $1732
ADDRLP4 1360
ADDRGP4 $342
ASGNP4
LABELV $1733
ADDRGP4 $1730
ARGP4
ADDRLP4 1368
CNSTI4 516
ASGNI4
ADDRLP4 260
INDIRP4
ADDRLP4 1368
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1368
INDIRI4
ADDP4
ARGP4
ADDRLP4 1360
INDIRP4
ARGP4
ADDRLP4 1372
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1372
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2660
;2658:            vic->client->pers.netname, (ent) ? G_admin_adminPrintName(ent)
;2659:            : "console"));
;2660:  }
ADDRGP4 $1725
JUMPV
LABELV $1724
line 2662
;2661:  else
;2662:  {
line 2663
;2663:    if (!Q_stricmp(cmd, "unmute"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $224
ARGP4
ADDRLP4 1356
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1356
INDIRI4
CNSTI4 0
NEI4 $1734
line 2664
;2664:    {
line 2665
;2665:      ADMP("^3!unmute: ^7player is not currently muted\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1736
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2666
;2666:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1712
JUMPV
LABELV $1734
line 2668
;2667:    }
;2668:    vic->client->pers.muted = qtrue;
ADDRLP4 260
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 1
ASGNI4
line 2669
;2669:    CPx(pids[0], "cp \"^1You've been muted\"");
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 $1737
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2670
;2670:    AP(va("print \"^3!mute: ^7%s^7 has been muted by ^7%s\n\"",
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1740
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1364
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 1360
ADDRLP4 1364
INDIRP4
ASGNP4
ADDRGP4 $1741
JUMPV
LABELV $1740
ADDRLP4 1360
ADDRGP4 $342
ASGNP4
LABELV $1741
ADDRGP4 $1738
ARGP4
ADDRLP4 1368
CNSTI4 516
ASGNI4
ADDRLP4 260
INDIRP4
ADDRLP4 1368
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1368
INDIRI4
ADDP4
ARGP4
ADDRLP4 1360
INDIRP4
ARGP4
ADDRLP4 1372
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1372
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2673
;2671:            vic->client->pers.netname, (ent) ? G_admin_adminPrintName(ent)
;2672:            : "console"));
;2673:  }
LABELV $1725
line 2674
;2674:  ClientUserinfoChanged(pids[0]);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 2675
;2675:  return qtrue;
CNSTI4 1
RETI4
LABELV $1712
endproc G_admin_mute 1376 12
export G_admin_cp
proc G_admin_cp 16 8
line 2680
;2676:}
;2677:
;2678:qboolean
;2679:G_admin_cp(gentity_t *ent, int skiparg)
;2680:{
line 2684
;2681:  int minargc;
;2682:  char *s;
;2683:
;2684:  minargc = 2 + skiparg;
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 2686
;2685:
;2686:  if (G_SayArgc() < minargc)
ADDRLP4 8
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $1743
line 2687
;2687:  {
line 2688
;2688:    ADMP("^3!cp: ^7usage: !cp [message]\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1745
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2689
;2689:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1742
JUMPV
LABELV $1743
line 2692
;2690:  }
;2691:
;2692:  s = G_SayConcatArgs(1 + skiparg);
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 2693
;2693:  G_CP(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_CP
CALLV
pop
line 2694
;2694:  return qtrue;
CNSTI4 1
RETI4
LABELV $1742
endproc G_admin_cp 16 8
export G_admin_denybuild
proc G_admin_denybuild 1380 12
line 2699
;2695:}
;2696:
;2697:qboolean
;2698:G_admin_denybuild(gentity_t *ent, int skiparg)
;2699:{
line 2705
;2700:  int pids[MAX_CLIENTS];
;2701:  char name[MAX_NAME_LENGTH], err[MAX_STRING_CHARS];
;2702:  char command[MAX_ADMIN_CMD_LEN], *cmd;
;2703:  gentity_t *vic;
;2704:
;2705:  G_SayArgv(skiparg, command, sizeof(command));
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 296
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2706
;2706:  cmd = command;
ADDRLP4 0
ADDRLP4 296
ASGNP4
line 2707
;2707:  if (cmd && *cmd == '!')
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1747
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 33
NEI4 $1747
line 2708
;2708:    cmd++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $1747
line 2709
;2709:  if (G_SayArgc() < 2 + skiparg)
ADDRLP4 1344
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 1344
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $1749
line 2710
;2710:  {
line 2711
;2711:    ADMP(va("^3!%s: ^7usage: !%s [name|slot#]\n", cmd, cmd));
ADDRGP4 $1717
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1352
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1352
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2712
;2712:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1746
JUMPV
LABELV $1749
line 2714
;2713:  }
;2714:  G_SayArgv(1 + skiparg, name, sizeof(name));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 264
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2715
;2715:  if (G_ClientNumbersFromString(name, pids) != 1)
ADDRLP4 264
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1348
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 1348
INDIRI4
CNSTI4 1
EQI4 $1751
line 2716
;2716:  {
line 2717
;2717:    G_MatchOnePlayer(pids, err, sizeof(err));
ADDRLP4 8
ARGP4
ADDRLP4 316
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLI4
pop
line 2718
;2718:    ADMP(va("^3!%s: ^7%s\n", cmd, err));
ADDRGP4 $1720
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 316
ARGP4
ADDRLP4 1352
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1352
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2719
;2719:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1746
JUMPV
LABELV $1751
line 2721
;2720:  }
;2721:  if (!admin_higher(ent, &g_entities[pids[0]]))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2476
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1352
ADDRGP4 admin_higher
CALLI4
ASGNI4
ADDRLP4 1352
INDIRI4
CNSTI4 0
NEI4 $1753
line 2722
;2722:  {
line 2723
;2723:    ADMP(va("^3!%s: ^7sorry, but your intended victim has a higher admin"
ADDRGP4 $1723
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1356
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1356
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2725
;2724:            " level than you\n", cmd));
;2725:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1746
JUMPV
LABELV $1753
line 2727
;2726:  }
;2727:  vic = &g_entities[pids[0]];
ADDRLP4 4
CNSTI4 2476
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2728
;2728:  if (vic->client->pers.denyBuild)
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1755
line 2729
;2729:  {
line 2730
;2730:    if (!Q_stricmp(cmd, "denybuild"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $95
ARGP4
ADDRLP4 1356
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1356
INDIRI4
CNSTI4 0
NEI4 $1757
line 2731
;2731:    {
line 2732
;2732:      ADMP("^3!denybuild: ^7player already has no building rights\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1759
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2733
;2733:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1746
JUMPV
LABELV $1757
line 2735
;2734:    }
;2735:    vic->client->pers.denyBuild = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 996
ADDP4
CNSTI4 0
ASGNI4
line 2736
;2736:    CPx(pids[0], "cp \"^1You've regained your building rights\"");
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 $1760
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2737
;2737:    AP(
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1763
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1364
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 1360
ADDRLP4 1364
INDIRP4
ASGNP4
ADDRGP4 $1764
JUMPV
LABELV $1763
ADDRLP4 1360
ADDRGP4 $342
ASGNP4
LABELV $1764
ADDRGP4 $1761
ARGP4
ADDRLP4 1368
CNSTI4 516
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 1368
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1368
INDIRI4
ADDP4
ARGP4
ADDRLP4 1360
INDIRP4
ARGP4
ADDRLP4 1372
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1372
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2742
;2738:        va(
;2739:            "print \"^3!allowbuild: ^7building rights for ^7%s^7 restored by %s\n\"",
;2740:            vic->client->pers.netname, (ent) ? G_admin_adminPrintName(ent)
;2741:            : "console"));
;2742:  }
ADDRGP4 $1756
JUMPV
LABELV $1755
line 2744
;2743:  else
;2744:  {
line 2745
;2745:    if (!Q_stricmp(cmd, "allowbuild"))
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $94
ARGP4
ADDRLP4 1356
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1356
INDIRI4
CNSTI4 0
NEI4 $1765
line 2746
;2746:    {
line 2747
;2747:      ADMP("^3!allowbuild: ^7player already has building rights\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1767
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2748
;2748:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1746
JUMPV
LABELV $1765
line 2750
;2749:    }
;2750:    vic->client->pers.denyBuild = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 996
ADDP4
CNSTI4 1
ASGNI4
line 2751
;2751:    vic->client->ps.stats[STAT_BUILDABLE] = BA_NONE;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 0
ASGNI4
line 2752
;2752:    if (vic->client->ps.stats[STAT_PCLASS] == PCL_ALIEN_BUILDER0 || vic->client->ps.stats[STAT_PCLASS] == PCL_ALIEN_BUILDER0_UPG)
ADDRLP4 1360
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1360
INDIRI4
CNSTI4 1
EQI4 $1770
ADDRLP4 1360
INDIRI4
CNSTI4 2
NEI4 $1768
LABELV $1770
line 2753
;2753:    {
line 2754
;2754:      vic->suicideTime = level.time + 1000;
ADDRLP4 4
INDIRP4
CNSTI4 1920
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2755
;2755:    }
LABELV $1768
line 2756
;2756:    CPx(pids[0], "cp \"^1You've lost your building rights\"");
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 $1772
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2757
;2757:    AP(
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1775
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1368
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 1364
ADDRLP4 1368
INDIRP4
ASGNP4
ADDRGP4 $1776
JUMPV
LABELV $1775
ADDRLP4 1364
ADDRGP4 $342
ASGNP4
LABELV $1776
ADDRGP4 $1773
ARGP4
ADDRLP4 1372
CNSTI4 516
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 1372
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1372
INDIRI4
ADDP4
ARGP4
ADDRLP4 1364
INDIRP4
ARGP4
ADDRLP4 1376
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1376
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2762
;2758:        va(
;2759:            "print \"^3!denybuild: ^7building rights for ^7%s^7 revoked by ^7%s\n\"",
;2760:            vic->client->pers.netname, (ent) ? G_admin_adminPrintName(ent)
;2761:            : "console"));
;2762:  }
LABELV $1756
line 2763
;2763:  ClientUserinfoChanged(pids[0]);
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 2764
;2764:  return qtrue;
CNSTI4 1
RETI4
LABELV $1746
endproc G_admin_denybuild 1380 12
lit
align 1
LABELV $1778
byte 1 0
skip 31
align 1
LABELV $1779
byte 1 0
skip 31
export G_admin_listadmins
code
proc G_admin_listadmins 124 20
line 2769
;2765:}
;2766:
;2767:qboolean
;2768:G_admin_listadmins(gentity_t *ent, int skiparg)
;2769:{
line 2770
;2770:  int i, found = 0;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 2772
;2771:  char search[MAX_NAME_LENGTH] =
;2772:  { "" };
ADDRLP4 52
ADDRGP4 $1778
INDIRB
ASGNB 32
line 2774
;2773:  char s[MAX_NAME_LENGTH] =
;2774:  { "" };
ADDRLP4 4
ADDRGP4 $1779
INDIRB
ASGNB 32
line 2775
;2775:  int start = 0;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 2776
;2776:  qboolean numeric = qtrue;
ADDRLP4 48
CNSTI4 1
ASGNI4
line 2777
;2777:  int drawn = 0;
ADDRLP4 84
CNSTI4 0
ASGNI4
line 2778
;2778:  int minlevel = 1;
ADDRLP4 36
CNSTI4 1
ASGNI4
line 2780
;2779:
;2780:  if (G_SayArgc() == 3 + skiparg)
ADDRLP4 88
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
NEI4 $1780
line 2781
;2781:  {
line 2782
;2782:    G_SayArgv(2 + skiparg, s, sizeof(s));
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2783
;2783:    if (s[0] >= '0' && s[0] <= '9')
ADDRLP4 92
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 48
LTI4 $1782
ADDRLP4 92
INDIRI4
CNSTI4 57
GTI4 $1782
line 2784
;2784:    {
line 2785
;2785:      minlevel = atoi(s);
ADDRLP4 4
ARGP4
ADDRLP4 96
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 96
INDIRI4
ASGNI4
line 2786
;2786:      if (minlevel < 1)
ADDRLP4 36
INDIRI4
CNSTI4 1
GEI4 $1784
line 2787
;2787:        minlevel = 1;
ADDRLP4 36
CNSTI4 1
ASGNI4
LABELV $1784
line 2788
;2788:    }
LABELV $1782
line 2789
;2789:  }
LABELV $1780
line 2791
;2790:
;2791:  for(i = 0;i < MAX_ADMIN_ADMINS && g_admin_admins[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1789
JUMPV
LABELV $1786
line 2792
;2792:  {
line 2793
;2793:    if (g_admin_admins[i]->level >= minlevel)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
LTI4 $1790
line 2794
;2794:      found++;
ADDRLP4 40
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1790
line 2795
;2795:  }
LABELV $1787
line 2791
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1789
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $1792
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1786
LABELV $1792
line 2796
;2796:  if (!found)
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $1793
line 2797
;2797:  {
line 2798
;2798:    if (minlevel > 1)
ADDRLP4 36
INDIRI4
CNSTI4 1
LEI4 $1795
line 2799
;2799:    {
line 2800
;2800:      ADMP(va("^3!listadmins: ^7no admins level %i or greater found\n",
ADDRGP4 $1797
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2802
;2801:              minlevel));
;2802:    }
ADDRGP4 $1796
JUMPV
LABELV $1795
line 2804
;2803:    else
;2804:    {
line 2805
;2805:      ADMP("^3!listadmins: ^7no admins defined\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1798
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2806
;2806:    }
LABELV $1796
line 2807
;2807:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1777
JUMPV
LABELV $1793
line 2810
;2808:  }
;2809:
;2810:  if (G_SayArgc() >= 2 + skiparg)
ADDRLP4 96
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
LTI4 $1799
line 2811
;2811:  {
line 2812
;2812:    G_SayArgv(1 + skiparg, s, sizeof(s));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 2813
;2813:    for(i = 0;i < sizeof(s) && s[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1804
JUMPV
LABELV $1801
line 2814
;2814:    {
line 2815
;2815:      if (s[i] >= '0' && s[i] <= '9')
ADDRLP4 100
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 48
LTI4 $1805
ADDRLP4 100
INDIRI4
CNSTI4 57
GTI4 $1805
line 2816
;2816:        continue;
ADDRGP4 $1802
JUMPV
LABELV $1805
line 2817
;2817:      numeric = qfalse;
ADDRLP4 48
CNSTI4 0
ASGNI4
line 2818
;2818:    }
LABELV $1802
line 2813
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1804
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 32
GEU4 $1807
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1801
LABELV $1807
line 2819
;2819:    if (numeric)
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $1808
line 2820
;2820:    {
line 2821
;2821:      start = atoi(s);
ADDRLP4 4
ARGP4
ADDRLP4 104
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 104
INDIRI4
ASGNI4
line 2822
;2822:      if (start > 0)
ADDRLP4 44
INDIRI4
CNSTI4 0
LEI4 $1810
line 2823
;2823:        start -= 1;
ADDRLP4 44
ADDRLP4 44
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $1809
JUMPV
LABELV $1810
line 2824
;2824:      else if (start < 0)
ADDRLP4 44
INDIRI4
CNSTI4 0
GEI4 $1809
line 2825
;2825:        start = found + start;
ADDRLP4 44
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
ASGNI4
line 2826
;2826:    }
ADDRGP4 $1809
JUMPV
LABELV $1808
line 2828
;2827:    else
;2828:      G_SanitiseString(s, search, sizeof(search));
ADDRLP4 4
ARGP4
ADDRLP4 52
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
LABELV $1809
line 2829
;2829:  }
LABELV $1799
line 2831
;2830:
;2831:  if (start >= found || start < 0)
ADDRLP4 44
INDIRI4
ADDRLP4 40
INDIRI4
GEI4 $1816
ADDRLP4 44
INDIRI4
CNSTI4 0
GEI4 $1814
LABELV $1816
line 2832
;2832:    start = 0;
ADDRLP4 44
CNSTI4 0
ASGNI4
LABELV $1814
line 2834
;2833:
;2834:  drawn = admin_listadmins(ent, start, search, minlevel);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 admin_listadmins
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 104
INDIRI4
ASGNI4
line 2836
;2835:
;2836:  if (search[0])
ADDRLP4 52
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1817
line 2837
;2837:  {
line 2838
;2838:    if (drawn <= 20)
ADDRLP4 84
INDIRI4
CNSTI4 20
GTI4 $1819
line 2839
;2839:    {
line 2840
;2840:      ADMP(
ADDRGP4 $1821
ARGP4
ADDRLP4 84
INDIRI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2844
;2841:          va(
;2842:              "^3!listadmins:^7 found %d admins level %i or greater matching '%s^7'\n",
;2843:              drawn, minlevel, search));
;2844:    }
ADDRGP4 $1818
JUMPV
LABELV $1819
line 2846
;2845:    else
;2846:    {
line 2847
;2847:      ADMP(
ADDRGP4 $1822
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 2851
;2848:          va(
;2849:              "^3!listadmins:^7 found >20 admins level %i or greater matching '%s^7. Try a more narrow search.'\n",
;2850:              minlevel, search));
;2851:    }
line 2852
;2852:  }
ADDRGP4 $1818
JUMPV
LABELV $1817
line 2854
;2853:  else
;2854:  {
line 2855
;2855:    ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 2856
;2856:    ADMBP(va(
ADDRGP4 $1823
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $1826
ADDRLP4 108
ADDRLP4 44
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $1827
JUMPV
LABELV $1826
ADDRLP4 108
CNSTI4 0
ASGNI4
LABELV $1827
ADDRLP4 108
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
CNSTI4 20
ADDI4
ADDRLP4 40
INDIRI4
LEI4 $1828
ADDRLP4 112
ADDRLP4 40
INDIRI4
ASGNI4
ADDRGP4 $1829
JUMPV
LABELV $1828
ADDRLP4 112
ADDRLP4 44
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
LABELV $1829
ADDRLP4 112
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 116
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2860
;2857:            "^3!listadmins:^7 showing admins level %i or greater %d - %d of %d.  ",
;2858:            minlevel, (found) ? (start + 1) : 0, ((start + MAX_ADMIN_LISTITEMS)
;2859:                > found) ? found : (start + MAX_ADMIN_LISTITEMS), found));
;2860:    if ((start + MAX_ADMIN_LISTITEMS) < found)
ADDRLP4 44
INDIRI4
CNSTI4 20
ADDI4
ADDRLP4 40
INDIRI4
GEI4 $1830
line 2861
;2861:    {
line 2862
;2862:      if (minlevel > 1)
ADDRLP4 36
INDIRI4
CNSTI4 1
LEI4 $1832
line 2863
;2863:      {
line 2864
;2864:        ADMBP(va("run '!listadmins %d %d' to see more", (start
ADDRGP4 $1834
ARGP4
ADDRLP4 44
INDIRI4
CNSTI4 20
ADDI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 120
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2866
;2865:                    + MAX_ADMIN_LISTITEMS + 1), minlevel));
;2866:      }
ADDRGP4 $1833
JUMPV
LABELV $1832
line 2868
;2867:      else
;2868:      {
line 2869
;2869:        ADMBP(va("run '!listadmins %d' to see more", (start
ADDRGP4 $1835
ARGP4
ADDRLP4 44
INDIRI4
CNSTI4 20
ADDI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 120
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2871
;2870:                    + MAX_ADMIN_LISTITEMS + 1)));
;2871:      }
LABELV $1833
line 2872
;2872:    }
LABELV $1830
line 2873
;2873:    ADMBP("\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $417
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2874
;2874:    ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 2875
;2875:  }
LABELV $1818
line 2876
;2876:  return qtrue;
CNSTI4 1
RETI4
LABELV $1777
endproc G_admin_listadmins 124 20
lit
align 1
LABELV $1837
byte 1 0
skip 63
export G_admin_listlayouts
code
proc G_admin_listlayouts 412 12
line 2881
;2877:}
;2878:
;2879:qboolean
;2880:G_admin_listlayouts(gentity_t *ent, int skiparg)
;2881:{
line 2884
;2882:  char list[MAX_CVAR_VALUE_STRING];
;2883:  char map[MAX_QPATH];
;2884:  int count = 0;
ADDRLP4 392
CNSTI4 0
ASGNI4
line 2887
;2885:  char *s;
;2886:  char layout[MAX_QPATH] =
;2887:  { "" };
ADDRLP4 4
ADDRGP4 $1837
INDIRB
ASGNB 64
line 2888
;2888:  int i = 0;
ADDRLP4 68
CNSTI4 0
ASGNI4
line 2890
;2889:
;2890:  if (G_SayArgc() == 2 + skiparg)
ADDRLP4 396
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 396
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
NEI4 $1838
line 2891
;2891:    G_SayArgv(1 + skiparg, map, sizeof(map));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 72
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
ADDRGP4 $1839
JUMPV
LABELV $1838
line 2893
;2892:  else
;2893:    trap_Cvar_VariableStringBuffer("mapname", map, sizeof(map));
ADDRGP4 $1580
ARGP4
ADDRLP4 72
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
LABELV $1839
line 2895
;2894:
;2895:  count = G_LayoutList(map, list, sizeof(list));
ADDRLP4 72
ARGP4
ADDRLP4 136
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 400
ADDRGP4 G_LayoutList
CALLI4
ASGNI4
ADDRLP4 392
ADDRLP4 400
INDIRI4
ASGNI4
line 2896
;2896:  ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 2897
;2897:  ADMBP(va("^3!listlayouts:^7 %d layouts found for '%s':\n", count, map));
ADDRGP4 $1840
ARGP4
ADDRLP4 392
INDIRI4
ARGI4
ADDRLP4 72
ARGP4
ADDRLP4 404
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 404
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2898
;2898:  s = &list[0];
ADDRLP4 0
ADDRLP4 136
ASGNP4
ADDRGP4 $1842
JUMPV
LABELV $1841
line 2900
;2899:  while(*s)
;2900:  {
line 2901
;2901:    if (*s == ' ')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $1844
line 2902
;2902:    {
line 2903
;2903:      ADMBP(va(" %s\n", layout));
ADDRGP4 $1846
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 408
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 408
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2904
;2904:      layout[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 2905
;2905:      i = 0;
ADDRLP4 68
CNSTI4 0
ASGNI4
line 2906
;2906:    }
ADDRGP4 $1845
JUMPV
LABELV $1844
line 2907
;2907:    else if (i < sizeof(layout) - 2)
ADDRLP4 68
INDIRI4
CVIU4 4
CNSTU4 62
GEU4 $1847
line 2908
;2908:    {
line 2909
;2909:      layout[i++] = *s;
ADDRLP4 408
ADDRLP4 68
INDIRI4
ASGNI4
ADDRLP4 68
ADDRLP4 408
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 408
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 2910
;2910:      layout[i] = '\0';
ADDRLP4 68
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 2911
;2911:    }
LABELV $1847
LABELV $1845
line 2912
;2912:    s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 2913
;2913:  }
LABELV $1842
line 2899
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1841
line 2914
;2914:  if (layout[0])
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1849
line 2915
;2915:    ADMBP(va(" %s\n", layout));
ADDRGP4 $1846
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 408
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 408
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
LABELV $1849
line 2916
;2916:  ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 2917
;2917:  return qtrue;
CNSTI4 1
RETI4
LABELV $1836
endproc G_admin_listlayouts 412 12
lit
align 1
LABELV $1852
byte 1 0
skip 31
align 1
LABELV $1853
byte 1 0
skip 31
align 1
LABELV $1854
byte 1 0
skip 31
export G_admin_listplayers
code
proc G_admin_listplayers 240 56
line 2922
;2918:}
;2919:
;2920:qboolean
;2921:G_admin_listplayers(gentity_t *ent, int skiparg)
;2922:{
line 2927
;2923:  int i, j;
;2924:  gclient_t *p;
;2925:  char c[3], t[2]; // color and team letter
;2926:  char n[MAX_NAME_LENGTH] =
;2927:  { "" };
ADDRLP4 129
ADDRGP4 $1852
INDIRB
ASGNB 32
line 2929
;2928:  char n2[MAX_NAME_LENGTH] =
;2929:  { "" };
ADDRLP4 161
ADDRGP4 $1853
INDIRB
ASGNB 32
line 2931
;2930:  char n3[MAX_NAME_LENGTH] =
;2931:  { "" };
ADDRLP4 44
ADDRGP4 $1854
INDIRB
ASGNB 32
line 2939
;2932:  char lname[MAX_NAME_LENGTH];
;2933:  char lname2[MAX_NAME_LENGTH];
;2934:  char guid_stub[9];
;2935:  char muted[2], denied[2], dbuilder[2];
;2936:  int l;
;2937:  char lname_fmt[5];
;2938:
;2939:  ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 2940
;2940:  ADMBP(va("^3!listplayers^7: %d players connected:\n",
ADDRGP4 $1855
ARGP4
ADDRGP4 level+173940
INDIRI4
ARGI4
ADDRLP4 204
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 2942
;2941:          level.numConnectedClients));
;2942:  for(i = 0;i < level.maxclients;i++)
ADDRLP4 120
CNSTI4 0
ASGNI4
ADDRGP4 $1860
JUMPV
LABELV $1857
line 2943
;2943:  {
line 2944
;2944:    p = &level.clients[i];
ADDRLP4 4
CNSTI4 2148
ADDRLP4 120
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 2945
;2945:    Q_strncpyz(t, "S", sizeof(t));
ADDRLP4 196
ARGP4
ADDRGP4 $1862
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2946
;2946:    Q_strncpyz(c, S_COLOR_YELLOW, sizeof(c));
ADDRLP4 193
ARGP4
ADDRGP4 $1275
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2947
;2947:    if (p->pers.teamSelection == PTE_HUMANS)
ADDRLP4 4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1863
line 2948
;2948:    {
line 2949
;2949:      Q_strncpyz(t, "H", sizeof(t));
ADDRLP4 196
ARGP4
ADDRGP4 $1626
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2950
;2950:      Q_strncpyz(c, S_COLOR_BLUE, sizeof(c));
ADDRLP4 193
ARGP4
ADDRGP4 $1865
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2951
;2951:    }
ADDRGP4 $1864
JUMPV
LABELV $1863
line 2952
;2952:    else if (p->pers.teamSelection == PTE_ALIENS)
ADDRLP4 4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1866
line 2953
;2953:    {
line 2954
;2954:      Q_strncpyz(t, "A", sizeof(t));
ADDRLP4 196
ARGP4
ADDRGP4 $1620
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2955
;2955:      Q_strncpyz(c, S_COLOR_RED, sizeof(c));
ADDRLP4 193
ARGP4
ADDRGP4 $1868
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2956
;2956:    }
LABELV $1866
LABELV $1864
line 2958
;2957:
;2958:    if (p->pers.connected == CON_CONNECTING)
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1869
line 2959
;2959:    {
line 2960
;2960:      Q_strncpyz(t, "C", sizeof(t));
ADDRLP4 196
ARGP4
ADDRGP4 $1871
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2961
;2961:      Q_strncpyz(c, S_COLOR_CYAN, sizeof(c));
ADDRLP4 193
ARGP4
ADDRGP4 $1872
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2962
;2962:    }
ADDRGP4 $1870
JUMPV
LABELV $1869
line 2963
;2963:    else if (p->pers.connected != CON_CONNECTED)
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1873
line 2964
;2964:    {
line 2965
;2965:      continue;
ADDRGP4 $1858
JUMPV
LABELV $1873
LABELV $1870
line 2968
;2966:    }
;2967:
;2968:    for(j = 0;j < 8;j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1875
line 2969
;2969:      guid_stub[j] = p->pers.guid[j + 24];
ADDRLP4 0
INDIRI4
ADDRLP4 76
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 720
ADDP4
ADDP4
INDIRI1
ASGNI1
LABELV $1876
line 2968
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $1875
line 2970
;2970:    guid_stub[j] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 76
ADDP4
CNSTI1 0
ASGNI1
line 2972
;2971:
;2972:    muted[0] = '\0';
ADDRLP4 198
CNSTI1 0
ASGNI1
line 2973
;2973:    if (p->pers.muted)
ADDRLP4 4
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1879
line 2974
;2974:    {
line 2975
;2975:      Q_strncpyz(muted, "M", sizeof(muted));
ADDRLP4 198
ARGP4
ADDRGP4 $1554
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2976
;2976:    }
LABELV $1879
line 2977
;2977:    denied[0] = '\0';
ADDRLP4 200
CNSTI1 0
ASGNI1
line 2978
;2978:    if (p->pers.denyBuild)
ADDRLP4 4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1881
line 2979
;2979:    {
line 2980
;2980:      Q_strncpyz(denied, "B", sizeof(denied));
ADDRLP4 200
ARGP4
ADDRGP4 $1883
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2981
;2981:    }
LABELV $1881
line 2983
;2982:
;2983:    dbuilder[0] = '\0';
ADDRLP4 202
CNSTI1 0
ASGNI1
line 2984
;2984:    if (p->pers.designatedBuilder)
ADDRLP4 4
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1884
line 2985
;2985:    {
line 2986
;2986:      if (!G_admin_permission(&g_entities[i], ADMF_INCOGNITO) && G_admin_permission(&g_entities[i], ADMF_DBUILDER) && G_admin_permission(ent,
CNSTI4 2476
ADDRLP4 120
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $1888
ARGP4
ADDRLP4 212
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 0
NEI4 $1886
CNSTI4 2476
ADDRLP4 120
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $1889
ARGP4
ADDRLP4 216
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 0
EQI4 $1886
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1890
ARGP4
ADDRLP4 220
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 0
EQI4 $1886
line 2988
;2987:          ADMF_SEESFULLLISTPLAYERS))
;2988:      {
line 2989
;2989:        Q_strncpyz(dbuilder, "P", sizeof(dbuilder));
ADDRLP4 202
ARGP4
ADDRGP4 $1891
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2990
;2990:      }
ADDRGP4 $1887
JUMPV
LABELV $1886
line 2992
;2991:      else
;2992:      {
line 2993
;2993:        Q_strncpyz(dbuilder, "D", sizeof(dbuilder));
ADDRLP4 202
ARGP4
ADDRGP4 $1578
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2994
;2994:      }
LABELV $1887
line 2995
;2995:    }
LABELV $1884
line 2997
;2996:
;2997:    l = 0;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 2998
;2998:    G_SanitiseString(p->pers.netname, n2, sizeof(n2));
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 161
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 2999
;2999:    n[0] = '\0';
ADDRLP4 129
CNSTI1 0
ASGNI1
line 3000
;3000:    for(j = 0;j < MAX_ADMIN_ADMINS && g_admin_admins[j];j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1895
JUMPV
LABELV $1892
line 3001
;3001:    {
line 3002
;3002:      if (!Q_stricmp(g_admin_admins[j]->guid, p->pers.guid))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 212
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 0
NEI4 $1896
line 3003
;3003:      {
line 3006
;3004:
;3005:        // don't gather aka or level info if the admin is incognito
;3006:        if (ent && G_admin_permission(&g_entities[i], ADMF_INCOGNITO))
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1898
CNSTI4 2476
ADDRLP4 120
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $1888
ARGP4
ADDRLP4 216
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 0
EQI4 $1898
line 3007
;3007:        {
line 3008
;3008:          break;
ADDRGP4 $1894
JUMPV
LABELV $1898
line 3010
;3009:        }
;3010:        l = g_admin_admins[j]->level;
ADDRLP4 40
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 3011
;3011:        G_SanitiseString(g_admin_admins[j]->name, n3, sizeof(n3));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 33
ADDP4
ARGP4
ADDRLP4 44
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 3012
;3012:        if (Q_stricmp(n2, n3))
ADDRLP4 161
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 220
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 0
EQI4 $1894
line 3013
;3013:        {
line 3014
;3014:          Q_strncpyz(n, g_admin_admins[j]->name, sizeof(n));
ADDRLP4 129
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 33
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3015
;3015:        }
line 3016
;3016:        break;
ADDRGP4 $1894
JUMPV
LABELV $1896
line 3018
;3017:      }
;3018:    }
LABELV $1893
line 3000
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1895
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $1902
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1892
LABELV $1902
LABELV $1894
line 3019
;3019:    lname[0] = '\0';
ADDRLP4 8
CNSTI1 0
ASGNI1
line 3020
;3020:    Q_strncpyz(lname_fmt, "%s", sizeof(lname_fmt));
ADDRLP4 124
ARGP4
ADDRGP4 $406
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3021
;3021:    for(j = 0;j < MAX_ADMIN_LEVELS && g_admin_levels[j];j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1906
JUMPV
LABELV $1903
line 3022
;3022:    {
line 3023
;3023:      if (g_admin_levels[j]->level == l)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $1907
line 3024
;3024:      {
line 3025
;3025:        Q_strncpyz(lname, g_admin_levels[j]->name, sizeof(lname));
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 3026
;3026:        if (*lname)
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1905
line 3027
;3027:        {
line 3028
;3028:          G_DecolorString(lname, lname2);
ADDRLP4 8
ARGP4
ADDRLP4 85
ARGP4
ADDRGP4 G_DecolorString
CALLV
pop
line 3029
;3029:          Com_sprintf(lname_fmt, sizeof(lname_fmt), "%%%is", (admin_level_maxname + strlen(lname) - strlen(lname2)));
ADDRLP4 8
ARGP4
ADDRLP4 216
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 85
ARGP4
ADDRLP4 220
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 124
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 $667
ARGP4
ADDRGP4 admin_level_maxname
INDIRI4
ADDRLP4 216
INDIRI4
ADDI4
ADDRLP4 220
INDIRI4
SUBI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 3030
;3030:          Com_sprintf(lname2, sizeof(lname2), lname_fmt, lname);
ADDRLP4 85
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 124
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3031
;3031:        }
line 3032
;3032:        break;
ADDRGP4 $1905
JUMPV
LABELV $1907
line 3035
;3033:      }
;3034:
;3035:    }
LABELV $1904
line 3021
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1906
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $1911
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1903
LABELV $1911
LABELV $1905
line 3037
;3036:
;3037:    if (G_admin_permission(ent, ADMF_SEESFULLLISTPLAYERS))
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1890
ARGP4
ADDRLP4 220
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 0
EQI4 $1912
line 3038
;3038:    {
line 3040
;3039:
;3040:      ADMBP(va("%2i %s%s^7 %-2i %s^7 (*%s) ^1%1s%1s%1s^7 %s^7 %s%s^7%s\n", i,
ADDRGP4 $1914
ARGP4
ADDRLP4 120
INDIRI4
ARGI4
ADDRLP4 193
ARGP4
ADDRLP4 196
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1920
ADDRLP4 224
ADDRLP4 85
ASGNP4
ADDRGP4 $1921
JUMPV
LABELV $1920
ADDRLP4 224
ADDRGP4 $93
ASGNP4
LABELV $1921
ADDRLP4 224
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 198
ARGP4
ADDRLP4 202
ARGP4
ADDRLP4 200
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 129
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1922
ADDRLP4 228
ADDRGP4 $1916
ASGNP4
ADDRGP4 $1923
JUMPV
LABELV $1922
ADDRLP4 228
ADDRGP4 $93
ASGNP4
LABELV $1923
ADDRLP4 228
INDIRP4
ARGP4
ADDRLP4 129
ARGP4
ADDRLP4 129
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1924
ADDRLP4 232
ADDRGP4 $1918
ASGNP4
ADDRGP4 $1925
JUMPV
LABELV $1924
ADDRLP4 232
ADDRGP4 $93
ASGNP4
LABELV $1925
ADDRLP4 232
INDIRP4
ARGP4
ADDRLP4 236
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 236
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3043
;3041:              c, t, l, (*lname) ? lname2 : "", guid_stub, muted, dbuilder, denied,
;3042:              p->pers.netname, (*n) ? "(a.k.a. " : "", n, (*n) ? ")" : ""));
;3043:    }
ADDRGP4 $1913
JUMPV
LABELV $1912
line 3045
;3044:    else
;3045:    {
line 3046
;3046:      ADMBP(va("%2i %s%s^7 ^1%1s%1s%1s^7 %s^7\n", i, c, t, muted, dbuilder,
ADDRGP4 $1926
ARGP4
ADDRLP4 120
INDIRI4
ARGI4
ADDRLP4 193
ARGP4
ADDRLP4 196
ARGP4
ADDRLP4 198
ARGP4
ADDRLP4 202
ARGP4
ADDRLP4 200
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 224
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 224
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3048
;3047:              denied, p->pers.netname));
;3048:    }
LABELV $1913
line 3049
;3049:  }
LABELV $1858
line 2942
ADDRLP4 120
ADDRLP4 120
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1860
ADDRLP4 120
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $1857
line 3050
;3050:  ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 3051
;3051:  return qtrue;
CNSTI4 1
RETI4
LABELV $1851
endproc G_admin_listplayers 240 56
proc SortMaps 4 8
line 3058
;3052:}
;3053:
;3054:#define MAX_LISTMAPS_MAPS 256
;3055:
;3056:static int
;3057:SortMaps(const void *a, const void *b)
;3058:{
line 3059
;3059:  return strcmp(*(char **) a, *(char **) b);
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $1927
endproc SortMaps 4 8
lit
align 1
LABELV $1929
byte 1 0
skip 4095
align 1
LABELV $1930
byte 1 0
skip 15
export G_admin_listmaps
code
proc G_admin_listmaps 5188 16
line 3064
;3060:}
;3061:
;3062:qboolean
;3063:G_admin_listmaps(gentity_t *ent, int skiparg)
;3064:{
line 3066
;3065:  char fileList[4096] =
;3066:  { "" };
ADDRLP4 1064
ADDRGP4 $1929
INDIRB
ASGNB 4096
line 3069
;3067:  char *fileSort[MAX_LISTMAPS_MAPS];
;3068:  char search[16] =
;3069:  { "" };
ADDRLP4 1044
ADDRGP4 $1930
INDIRB
ASGNB 16
line 3072
;3070:  int numFiles;
;3071:  int i;
;3072:  int fileLen = 0;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 3073
;3073:  int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3077
;3074:  char *filePtr;
;3075:  int rows;
;3076:
;3077:  if (G_SayArgc() > 1 + skiparg)
ADDRLP4 5160
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 5160
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
LEI4 $1931
line 3078
;3078:  {
line 3079
;3079:    G_SayArgv(skiparg + 1, search, sizeof(search));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1044
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3080
;3080:  }
LABELV $1931
line 3082
;3081:
;3082:  numFiles = trap_FS_GetFileList("maps/", ".bsp", fileList, sizeof(fileList));
ADDRGP4 $1933
ARGP4
ADDRGP4 $1934
ARGP4
ADDRLP4 1064
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 5164
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 1060
ADDRLP4 5164
INDIRI4
ASGNI4
line 3083
;3083:  filePtr = fileList;
ADDRLP4 12
ADDRLP4 1064
ASGNP4
line 3084
;3084:  for(i = 0;i < numFiles && count < MAX_LISTMAPS_MAPS;i++, filePtr += fileLen + 1)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1938
JUMPV
LABELV $1935
line 3085
;3085:  {
line 3086
;3086:    fileLen = strlen(filePtr);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 5168
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 5168
INDIRI4
ASGNI4
line 3087
;3087:    if (fileLen < 5)
ADDRLP4 1040
INDIRI4
CNSTI4 5
GEI4 $1939
line 3088
;3088:      continue;
ADDRGP4 $1936
JUMPV
LABELV $1939
line 3090
;3089:
;3090:    filePtr[fileLen - 4] = '\0';
ADDRLP4 1040
INDIRI4
CNSTI4 4
SUBI4
ADDRLP4 12
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 3092
;3091:
;3092:    if (search[0] && !strstr(filePtr, search))
ADDRLP4 1044
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1941
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 1044
ARGP4
ADDRLP4 5172
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 5172
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1941
line 3093
;3093:      continue;
ADDRGP4 $1936
JUMPV
LABELV $1941
line 3095
;3094:
;3095:    fileSort[count] = filePtr;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 3096
;3096:    count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3097
;3097:  }
LABELV $1936
line 3084
ADDRLP4 5168
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 5168
INDIRI4
ADDI4
ASGNI4
ADDRLP4 12
ADDRLP4 1040
INDIRI4
ADDRLP4 5168
INDIRI4
ADDI4
ADDRLP4 12
INDIRP4
ADDP4
ASGNP4
LABELV $1938
ADDRLP4 0
INDIRI4
ADDRLP4 1060
INDIRI4
GEI4 $1943
ADDRLP4 4
INDIRI4
CNSTI4 256
LTI4 $1935
LABELV $1943
line 3099
;3098:
;3099:  qsort(fileSort, count, sizeof(fileSort[0]), SortMaps);
ADDRLP4 16
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 SortMaps
ARGP4
ADDRGP4 qsort
CALLV
pop
line 3101
;3100:
;3101:  rows = count / 3;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 3
DIVI4
ASGNI4
line 3102
;3102:  if (rows * 3 < count)
CNSTI4 3
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRI4
GEI4 $1944
line 3103
;3103:    rows++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1944
line 3105
;3104:
;3105:  ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 3106
;3106:  for(i = 0;i < rows;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1949
JUMPV
LABELV $1946
line 3107
;3107:  {
line 3108
;3108:    ADMBP(va("^7%20s %20s %20s\n", fileSort[i],
ADDRGP4 $1950
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRLP4 4
INDIRI4
GEI4 $1953
ADDRLP4 5172
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1954
JUMPV
LABELV $1953
ADDRLP4 5172
ADDRGP4 $93
ASGNP4
LABELV $1954
ADDRLP4 5172
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRLP4 4
INDIRI4
GEI4 $1955
ADDRLP4 5176
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRLP4 16
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1956
JUMPV
LABELV $1955
ADDRLP4 5176
ADDRGP4 $93
ASGNP4
LABELV $1956
ADDRLP4 5176
INDIRP4
ARGP4
ADDRLP4 5184
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 5184
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3111
;3109:            (rows + i < count) ? fileSort[rows + i] : "",
;3110:            (rows * 2 + i < count) ? fileSort[rows * 2 + i] : ""));
;3111:  }
LABELV $1947
line 3106
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1949
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $1946
line 3112
;3112:  if (search[0])
ADDRLP4 1044
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1957
line 3113
;3113:    ADMBP(va("^3!listmaps: ^7found %d maps matching '%s^7'.\n",
ADDRGP4 $1959
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1044
ARGP4
ADDRLP4 5172
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 5172
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
ADDRGP4 $1958
JUMPV
LABELV $1957
line 3116
;3114:            count, search));
;3115:    else
;3116:    ADMBP(va("^3!listmaps: ^7listing %d maps.\n", count));
ADDRGP4 $1960
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 5176
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 5176
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
LABELV $1958
line 3118
;3117:
;3118:  ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 3120
;3119:
;3120:  return qtrue;
CNSTI4 1
RETI4
LABELV $1928
endproc G_admin_listmaps 5188 16
export G_admin_listrotation
proc G_admin_listrotation 44 24
line 3125
;3121:}
;3122:
;3123:qboolean
;3124:G_admin_listrotation(gentity_t *ent, int skiparg)
;3125:{
line 3127
;3126:  int i, j, statusColor;
;3127:  char *status = '\0';
ADDRLP4 12
CNSTP4 0
ASGNP4
line 3132
;3128:
;3129:  extern mapRotations_t mapRotations;
;3130:
;3131:  // Check for an active map rotation
;3132:  if (!G_MapRotationActive() || g_currentMapRotation.integer == NOT_ROTATING)
ADDRLP4 16
ADDRGP4 G_MapRotationActive
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $1965
ADDRGP4 g_currentMapRotation+12
INDIRI4
CNSTI4 -1
NEI4 $1962
LABELV $1965
line 3133
;3133:  {
line 3134
;3134:    trap_SendServerCommand(ent - g_entities, "print \"^3!rotation: ^7There is no active map rotation on this server\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $1966
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3135
;3135:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1961
JUMPV
LABELV $1962
line 3139
;3136:  }
;3137:
;3138:  // Locate the active map rotation and output its contents
;3139:  for(i = 0;i < mapRotations.numRotations;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1970
JUMPV
LABELV $1967
line 3140
;3140:  {
line 3141
;3141:    if (i == g_currentMapRotation.integer)
ADDRLP4 4
INDIRI4
ADDRGP4 g_currentMapRotation+12
INDIRI4
NEI4 $1972
line 3142
;3142:    {
line 3143
;3143:      ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 3144
;3144:      ADMBP(va("^3!rotation: ^7%s\n", mapRotations.rotations[i].name));
ADDRGP4 $1975
ARGP4
CNSTI4 1091144
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 mapRotations
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3146
;3145:
;3146:      for(j = 0;j < mapRotations.rotations[i].numMaps;j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1979
JUMPV
LABELV $1976
line 3147
;3147:      {
line 3148
;3148:        if (G_GetCurrentMap(i) == j)
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 G_GetCurrentMap
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1981
line 3149
;3149:        {
line 3150
;3150:          statusColor = 3;
ADDRLP4 8
CNSTI4 3
ASGNI4
line 3151
;3151:          status = "current slot";
ADDRLP4 12
ADDRGP4 $1983
ASGNP4
line 3152
;3152:        }
ADDRGP4 $1982
JUMPV
LABELV $1981
line 3153
;3153:        else if (!G_MapExists(mapRotations.rotations[i].maps[j].name))
CNSTI4 17048
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 1091144
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 G_MapExists
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $1984
line 3154
;3154:        {
line 3155
;3155:          statusColor = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 3156
;3156:          status = "missing";
ADDRLP4 12
ADDRGP4 $1987
ASGNP4
line 3157
;3157:        }
ADDRGP4 $1985
JUMPV
LABELV $1984
line 3159
;3158:        else
;3159:        {
line 3160
;3160:          statusColor = 7;
ADDRLP4 8
CNSTI4 7
ASGNI4
line 3161
;3161:          status = "";
ADDRLP4 12
ADDRGP4 $93
ASGNP4
line 3162
;3162:        }
LABELV $1985
LABELV $1982
line 3163
;3163:        ADMBP(va("^%i%3i %-20s ^%i%s\n", statusColor, j + 1,
ADDRGP4 $1988
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
CNSTI4 17048
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 1091144
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 mapRotations+64
ADDP4
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3165
;3164:                mapRotations.rotations[i].maps[j].name, statusColor, status));
;3165:      }
LABELV $1977
line 3146
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1979
ADDRLP4 0
INDIRI4
CNSTI4 1091144
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 mapRotations+1091136
ADDP4
INDIRI4
LTI4 $1976
line 3167
;3166:
;3167:      ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 3170
;3168:
;3169:      // No maps were found in the active map rotation
;3170:      if (mapRotations.rotations[i].numMaps < 1)
CNSTI4 1091144
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 mapRotations+1091136
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1990
line 3171
;3171:      {
line 3172
;3172:        trap_SendServerCommand(ent - g_entities, "print \"  - ^7Empty!\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 $1993
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3173
;3173:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1961
JUMPV
LABELV $1990
line 3175
;3174:      }
;3175:    }
LABELV $1972
line 3176
;3176:  }
LABELV $1968
line 3139
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1970
ADDRLP4 4
INDIRI4
ADDRGP4 mapRotations+17458304
INDIRI4
LTI4 $1967
line 3178
;3177:
;3178:  if (g_nextMap.string[0])
ADDRGP4 g_nextMap+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1994
line 3179
;3179:  {
line 3180
;3180:    ADMP(va("^5 Next map overriden by g_nextMap to: %s\n", g_nextMap.string));
ADDRGP4 $1997
ARGP4
ADDRGP4 g_nextMap+16
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3181
;3181:  }
LABELV $1994
line 3183
;3182:
;3183:  return qtrue;
CNSTI4 1
RETI4
LABELV $1961
endproc G_admin_listrotation 44 24
lit
align 1
LABELV $2000
byte 1 37
byte 1 115
byte 1 0
skip 29
align 1
LABELV $2001
byte 1 37
byte 1 115
byte 1 0
skip 29
align 1
LABELV $2002
byte 1 0
skip 31
align 1
LABELV $2003
byte 1 0
skip 63
align 1
LABELV $2004
byte 1 0
skip 63
align 1
LABELV $2005
byte 1 0
skip 31
export G_admin_showbans
code
proc G_admin_showbans 436 32
line 3188
;3184:}
;3185:
;3186:qboolean
;3187:G_admin_showbans(gentity_t *ent, int skiparg)
;3188:{
line 3189
;3189:  int i, found = 0;
ADDRLP4 312
CNSTI4 0
ASGNI4
line 3193
;3190:  int t;
;3191:  char duration[32];
;3192:  char name_fmt[32] =
;3193:  { "%s" };
ADDRLP4 196
ADDRGP4 $2000
INDIRB
ASGNB 32
line 3195
;3194:  char banner_fmt[32] =
;3195:  { "%s" };
ADDRLP4 228
ADDRGP4 $2001
INDIRB
ASGNB 32
line 3196
;3196:  int max_name = 1, max_banner = 1;
ADDRLP4 300
CNSTI4 1
ASGNI4
ADDRLP4 304
CNSTI4 1
ASGNI4
line 3198
;3197:  int secs;
;3198:  int start = 0;
ADDRLP4 320
CNSTI4 0
ASGNI4
line 3200
;3199:  char filter[MAX_NAME_LENGTH] =
;3200:  { "" };
ADDRLP4 156
ADDRGP4 $2002
INDIRB
ASGNB 32
line 3205
;3201:  char date[11];
;3202:  char *made;
;3203:  int j;
;3204:  char n1[MAX_NAME_LENGTH * 2] =
;3205:  { "" };
ADDRLP4 24
ADDRGP4 $2003
INDIRB
ASGNB 64
line 3207
;3206:  char n2[MAX_NAME_LENGTH * 2] =
;3207:  { "" };
ADDRLP4 88
ADDRGP4 $2004
INDIRB
ASGNB 64
line 3208
;3208:  qboolean numeric = qtrue;
ADDRLP4 292
CNSTI4 1
ASGNI4
line 3209
;3209:  char *ip_match = NULL;
ADDRLP4 188
CNSTP4 0
ASGNP4
line 3210
;3210:  int ip_match_len = 0;
ADDRLP4 308
CNSTI4 0
ASGNI4
line 3212
;3211:  char name_match[MAX_NAME_LENGTH] =
;3212:  { "" };
ADDRLP4 324
ADDRGP4 $2005
INDIRB
ASGNB 32
line 3213
;3213:  int show_count = 0;
ADDRLP4 152
CNSTI4 0
ASGNI4
line 3214
;3214:  qboolean subnetfilter = qfalse;
ADDRLP4 316
CNSTI4 0
ASGNI4
line 3216
;3215:
;3216:  t = trap_RealTime(NULL);
CNSTP4 0
ARGP4
ADDRLP4 356
ADDRGP4 trap_RealTime
CALLI4
ASGNI4
ADDRLP4 192
ADDRLP4 356
INDIRI4
ASGNI4
line 3218
;3217:
;3218:  for(i = 0;i < MAX_ADMIN_BANS && g_admin_bans[i];i++)
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $2009
JUMPV
LABELV $2006
line 3219
;3219:  {
line 3220
;3220:    if (g_admin_bans[i]->expires != 0 && (g_admin_bans[i]->expires - t) < 1)
ADDRLP4 360
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
EQI4 $2010
ADDRLP4 360
INDIRI4
ADDRLP4 192
INDIRI4
SUBI4
CNSTI4 1
GEI4 $2010
line 3221
;3221:    {
line 3222
;3222:      continue;
ADDRGP4 $2007
JUMPV
LABELV $2010
line 3224
;3223:    }
;3224:    found++;
ADDRLP4 312
ADDRLP4 312
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3225
;3225:  }
LABELV $2007
line 3218
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2009
ADDRLP4 20
INDIRI4
CNSTI4 1024
GEI4 $2012
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2006
LABELV $2012
line 3227
;3226:
;3227:  if (G_SayArgc() >= 2 + skiparg)
ADDRLP4 364
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 364
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
LTI4 $2013
line 3228
;3228:  {
line 3229
;3229:    G_SayArgv(1 + skiparg, filter, sizeof(filter));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 156
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3230
;3230:    if (G_SayArgc() >= 3 + skiparg)
ADDRLP4 368
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
LTI4 $2015
line 3231
;3231:    {
line 3232
;3232:      start = atoi(filter);
ADDRLP4 156
ARGP4
ADDRLP4 372
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 320
ADDRLP4 372
INDIRI4
ASGNI4
line 3233
;3233:      G_SayArgv(2 + skiparg, filter, sizeof(filter));
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 156
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3234
;3234:    }
LABELV $2015
line 3235
;3235:    for(i = 0;i < sizeof(filter) && filter[i];i++)
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $2020
JUMPV
LABELV $2017
line 3236
;3236:    {
line 3237
;3237:      if ((filter[i] < '0' || filter[i] > '9') && filter[i] != '.' && filter[i] != '-')
ADDRLP4 372
ADDRLP4 20
INDIRI4
ADDRLP4 156
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 48
LTI4 $2023
ADDRLP4 372
INDIRI4
CNSTI4 57
LEI4 $2021
LABELV $2023
ADDRLP4 376
ADDRLP4 20
INDIRI4
ADDRLP4 156
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 376
INDIRI4
CNSTI4 46
EQI4 $2021
ADDRLP4 376
INDIRI4
CNSTI4 45
EQI4 $2021
line 3238
;3238:      {
line 3239
;3239:        numeric = qfalse;
ADDRLP4 292
CNSTI4 0
ASGNI4
line 3240
;3240:        break;
ADDRGP4 $2019
JUMPV
LABELV $2021
line 3242
;3241:      }
;3242:    }
LABELV $2018
line 3235
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2020
ADDRLP4 20
INDIRI4
CVIU4 4
CNSTU4 32
GEU4 $2024
ADDRLP4 20
INDIRI4
ADDRLP4 156
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2017
LABELV $2024
LABELV $2019
line 3244
;3243:
;3244:    if (!numeric)
ADDRLP4 292
INDIRI4
CNSTI4 0
NEI4 $2025
line 3245
;3245:    {
line 3246
;3246:      if (filter[0] != '-')
ADDRLP4 156
INDIRI1
CVII4 1
CNSTI4 45
EQI4 $2027
line 3247
;3247:      {
line 3248
;3248:        G_SanitiseString(filter, name_match, sizeof(name_match));
ADDRLP4 156
ARGP4
ADDRLP4 324
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 3250
;3249:
;3250:      }
ADDRGP4 $2026
JUMPV
LABELV $2027
line 3252
;3251:      else
;3252:      {
line 3253
;3253:        if (!Q_strncmp(filter, "-sub", 4))
ADDRLP4 156
ARGP4
ADDRGP4 $2031
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 376
ADDRGP4 Q_strncmp
CALLI4
ASGNI4
ADDRLP4 376
INDIRI4
CNSTI4 0
NEI4 $2029
line 3254
;3254:        {
line 3255
;3255:          subnetfilter = qtrue;
ADDRLP4 316
CNSTI4 1
ASGNI4
line 3256
;3256:        }
ADDRGP4 $2026
JUMPV
LABELV $2029
line 3258
;3257:        else
;3258:        {
line 3259
;3259:          ADMP(va("^3!showbans: ^7invalid argument %s\n", filter));
ADDRGP4 $2032
ARGP4
ADDRLP4 156
ARGP4
ADDRLP4 380
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 380
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3260
;3260:          return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1999
JUMPV
line 3262
;3261:        }
;3262:      }
line 3263
;3263:    }
LABELV $2025
line 3264
;3264:    else if (strchr(filter, '.') != NULL)
ADDRLP4 156
ARGP4
CNSTI4 46
ARGI4
ADDRLP4 376
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 376
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2033
line 3265
;3265:    {
line 3266
;3266:      ip_match = filter;
ADDRLP4 188
ADDRLP4 156
ASGNP4
line 3267
;3267:      ip_match_len = strlen(ip_match);
ADDRLP4 188
INDIRP4
ARGP4
ADDRLP4 380
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 308
ADDRLP4 380
INDIRI4
ASGNI4
line 3268
;3268:    }
ADDRGP4 $2034
JUMPV
LABELV $2033
line 3270
;3269:    else
;3270:    {
line 3271
;3271:      start = atoi(filter);
ADDRLP4 156
ARGP4
ADDRLP4 380
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 320
ADDRLP4 380
INDIRI4
ASGNI4
line 3272
;3272:      filter[0] = '\0';
ADDRLP4 156
CNSTI1 0
ASGNI1
line 3273
;3273:    }
LABELV $2034
LABELV $2026
line 3275
;3274:    // showbans 1 means start with ban 0
;3275:    if (start > 0)
ADDRLP4 320
INDIRI4
CNSTI4 0
LEI4 $2035
line 3276
;3276:      start -= 1;
ADDRLP4 320
ADDRLP4 320
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $2036
JUMPV
LABELV $2035
line 3277
;3277:    else if (start < 0)
ADDRLP4 320
INDIRI4
CNSTI4 0
GEI4 $2037
line 3278
;3278:      start = found + start;
ADDRLP4 320
ADDRLP4 312
INDIRI4
ADDRLP4 320
INDIRI4
ADDI4
ASGNI4
LABELV $2037
LABELV $2036
line 3279
;3279:  }
LABELV $2013
line 3281
;3280:
;3281:  if (start >= MAX_ADMIN_BANS || start < 0)
ADDRLP4 320
INDIRI4
CNSTI4 1024
GEI4 $2041
ADDRLP4 320
INDIRI4
CNSTI4 0
GEI4 $2039
LABELV $2041
line 3282
;3282:    start = 0;
ADDRLP4 320
CNSTI4 0
ASGNI4
LABELV $2039
line 3284
;3283:
;3284:  for(i = start;i < MAX_ADMIN_BANS && g_admin_bans[i] && show_count < MAX_ADMIN_SHOWBANS;i++)
ADDRLP4 20
ADDRLP4 320
INDIRI4
ASGNI4
ADDRGP4 $2045
JUMPV
LABELV $2042
line 3285
;3285:  {
line 3286
;3286:    qboolean match = qfalse;
ADDRLP4 372
CNSTI4 0
ASGNI4
line 3288
;3287:
;3288:    if (!numeric)
ADDRLP4 292
INDIRI4
CNSTI4 0
NEI4 $2046
line 3289
;3289:    {
line 3290
;3290:      if (!subnetfilter)
ADDRLP4 316
INDIRI4
CNSTI4 0
NEI4 $2048
line 3291
;3291:      {
line 3292
;3292:        G_SanitiseString(g_admin_bans[i]->name, n1, sizeof(n1));
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 3293
;3293:        if (strstr(n1, name_match))
ADDRLP4 24
ARGP4
ADDRLP4 324
ARGP4
ADDRLP4 376
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 376
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2049
line 3294
;3294:          match = qtrue;
ADDRLP4 372
CNSTI4 1
ASGNI4
line 3295
;3295:      }
ADDRGP4 $2049
JUMPV
LABELV $2048
line 3297
;3296:      else
;3297:      {
line 3298
;3298:        int mask = -1;
ADDRLP4 380
CNSTI4 -1
ASGNI4
line 3300
;3299:        int dummy;
;3300:        int scanflen = 0;
ADDRLP4 384
CNSTI4 0
ASGNI4
line 3301
;3301:        scanflen = sscanf(g_admin_bans[i]->ip, "%d.%d.%d.%d/%d", &dummy, &dummy, &dummy, &dummy, &mask);
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRGP4 $759
ARGP4
ADDRLP4 376
ARGP4
ADDRLP4 376
ARGP4
ADDRLP4 376
ARGP4
ADDRLP4 376
ARGP4
ADDRLP4 380
ARGP4
ADDRLP4 388
ADDRGP4 sscanf
CALLI4
ASGNI4
ADDRLP4 384
ADDRLP4 388
INDIRI4
ASGNI4
line 3302
;3302:        if (scanflen == 5 && mask < 32)
ADDRLP4 384
INDIRI4
CNSTI4 5
NEI4 $2052
ADDRLP4 380
INDIRI4
CNSTI4 32
GEI4 $2052
line 3303
;3303:        {
line 3304
;3304:          match = qtrue;
ADDRLP4 372
CNSTI4 1
ASGNI4
line 3305
;3305:        }
LABELV $2052
line 3306
;3306:      }
LABELV $2049
line 3307
;3307:    }
LABELV $2046
line 3309
;3308:
;3309:    if ((match) || !ip_match || Q_strncmp(ip_match, g_admin_bans[i]->ip, ip_match_len) == 0)
ADDRLP4 372
INDIRI4
CNSTI4 0
NEI4 $2057
ADDRLP4 188
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2057
ADDRLP4 188
INDIRP4
ARGP4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 380
ADDRGP4 Q_strncmp
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 0
NEI4 $2054
LABELV $2057
line 3310
;3310:    {
line 3311
;3311:      G_DecolorString(g_admin_bans[i]->name, n1);
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 G_DecolorString
CALLV
pop
line 3312
;3312:      G_DecolorString(g_admin_bans[i]->banner, n2);
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 G_DecolorString
CALLV
pop
line 3313
;3313:      if (strlen(n1) > max_name)
ADDRLP4 24
ARGP4
ADDRLP4 384
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 384
INDIRI4
ADDRLP4 300
INDIRI4
LEI4 $2058
line 3314
;3314:      {
line 3315
;3315:        max_name = strlen(n1);
ADDRLP4 24
ARGP4
ADDRLP4 388
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 300
ADDRLP4 388
INDIRI4
ASGNI4
line 3316
;3316:      }
LABELV $2058
line 3317
;3317:      if (strlen(n2) > max_banner)
ADDRLP4 88
ARGP4
ADDRLP4 388
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 388
INDIRI4
ADDRLP4 304
INDIRI4
LEI4 $2060
line 3318
;3318:        max_banner = strlen(n2);
ADDRLP4 88
ARGP4
ADDRLP4 392
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 304
ADDRLP4 392
INDIRI4
ASGNI4
LABELV $2060
line 3320
;3319:
;3320:      show_count++;
ADDRLP4 152
ADDRLP4 152
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3321
;3321:    }
LABELV $2054
line 3322
;3322:  }
LABELV $2043
line 3284
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2045
ADDRLP4 20
INDIRI4
CNSTI4 1024
GEI4 $2063
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2063
ADDRLP4 152
INDIRI4
CNSTI4 10
LTI4 $2042
LABELV $2063
line 3324
;3323:
;3324:  if (start >= found)
ADDRLP4 320
INDIRI4
ADDRLP4 312
INDIRI4
LTI4 $2064
line 3325
;3325:  {
line 3326
;3326:    ADMP(va("^3!showbans: ^7there are %d active bans\n", found));
ADDRGP4 $2066
ARGP4
ADDRLP4 312
INDIRI4
ARGI4
ADDRLP4 376
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 376
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3327
;3327:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1999
JUMPV
LABELV $2064
line 3329
;3328:  }
;3329:  ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 3330
;3330:  show_count = 0;
ADDRLP4 152
CNSTI4 0
ASGNI4
line 3331
;3331:  for(i = start;i < MAX_ADMIN_BANS && g_admin_bans[i] && show_count < MAX_ADMIN_SHOWBANS;i++)
ADDRLP4 20
ADDRLP4 320
INDIRI4
ASGNI4
ADDRGP4 $2070
JUMPV
LABELV $2067
line 3332
;3332:  {
line 3333
;3333:    if (g_admin_bans[i]->expires != 0 && (g_admin_bans[i]->expires - t) < 1)
ADDRLP4 376
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ASGNI4
ADDRLP4 376
INDIRI4
CNSTI4 0
EQI4 $2071
ADDRLP4 376
INDIRI4
ADDRLP4 192
INDIRI4
SUBI4
CNSTI4 1
GEI4 $2071
line 3334
;3334:      continue;
ADDRGP4 $2068
JUMPV
LABELV $2071
line 3336
;3335:
;3336:    if (!numeric)
ADDRLP4 292
INDIRI4
CNSTI4 0
NEI4 $2073
line 3337
;3337:    {
line 3338
;3338:      if (!subnetfilter)
ADDRLP4 316
INDIRI4
CNSTI4 0
NEI4 $2075
line 3339
;3339:      {
line 3340
;3340:        G_SanitiseString(g_admin_bans[i]->name, n1, sizeof(n1));
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 3341
;3341:        if (strstr(n1, name_match) == NULL)
ADDRLP4 24
ARGP4
ADDRLP4 324
ARGP4
ADDRLP4 380
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 380
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2074
line 3342
;3342:          continue;
ADDRGP4 $2068
JUMPV
line 3343
;3343:      }
LABELV $2075
line 3345
;3344:      else
;3345:      {
line 3346
;3346:        int mask = -1;
ADDRLP4 384
CNSTI4 -1
ASGNI4
line 3348
;3347:        int dummy;
;3348:        int scanflen = 0;
ADDRLP4 388
CNSTI4 0
ASGNI4
line 3349
;3349:        scanflen = sscanf(g_admin_bans[i]->ip, "%d.%d.%d.%d/%d", &dummy, &dummy, &dummy, &dummy, &mask);
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRGP4 $759
ARGP4
ADDRLP4 380
ARGP4
ADDRLP4 380
ARGP4
ADDRLP4 380
ARGP4
ADDRLP4 380
ARGP4
ADDRLP4 384
ARGP4
ADDRLP4 392
ADDRGP4 sscanf
CALLI4
ASGNI4
ADDRLP4 388
ADDRLP4 392
INDIRI4
ASGNI4
line 3350
;3350:        if (scanflen != 5 || mask >= 32)
ADDRLP4 388
INDIRI4
CNSTI4 5
NEI4 $2081
ADDRLP4 384
INDIRI4
CNSTI4 32
LTI4 $2074
LABELV $2081
line 3351
;3351:        {
line 3352
;3352:          continue;
ADDRGP4 $2068
JUMPV
line 3354
;3353:        }
;3354:      }
line 3355
;3355:    }
LABELV $2073
line 3356
;3356:    else if (ip_match != NULL && Q_strncmp(ip_match, g_admin_bans[i]->ip, ip_match_len) != 0)
ADDRLP4 188
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2082
ADDRLP4 188
INDIRP4
ARGP4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 384
ADDRGP4 Q_strncmp
CALLI4
ASGNI4
ADDRLP4 384
INDIRI4
CNSTI4 0
EQI4 $2082
line 3357
;3357:      continue;
ADDRGP4 $2068
JUMPV
LABELV $2082
LABELV $2074
line 3360
;3358:
;3359:    // only print out the the date part of made
;3360:    date[0] = '\0';
ADDRLP4 8
CNSTI1 0
ASGNI1
line 3361
;3361:    made = g_admin_bans[i]->made;
ADDRLP4 0
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 135
ADDP4
ASGNP4
line 3362
;3362:    for(j = 0;made && *made;j++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2087
JUMPV
LABELV $2084
line 3363
;3363:    {
line 3364
;3364:      if ((j + 1) >= sizeof(date))
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
CVIU4 4
CNSTU4 11
LTU4 $2088
line 3365
;3365:        break;
ADDRGP4 $2086
JUMPV
LABELV $2088
line 3366
;3366:      if (*made == ' ')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
NEI4 $2090
line 3367
;3367:        break;
ADDRGP4 $2086
JUMPV
LABELV $2090
line 3368
;3368:      date[j] = *made;
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 3369
;3369:      date[j + 1] = '\0';
ADDRLP4 4
INDIRI4
ADDRLP4 8+1
ADDP4
CNSTI1 0
ASGNI1
line 3370
;3370:      made++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 3371
;3371:    }
LABELV $2085
line 3362
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2087
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2093
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2084
LABELV $2093
LABELV $2086
line 3373
;3372:
;3373:    secs = (g_admin_bans[i]->expires - t);
ADDRLP4 296
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
ADDRLP4 192
INDIRI4
SUBI4
ASGNI4
line 3374
;3374:    G_admin_duration(secs, duration, sizeof(duration));
ADDRLP4 296
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_admin_duration
CALLV
pop
line 3376
;3375:
;3376:    G_DecolorString(g_admin_bans[i]->name, n1);
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 G_DecolorString
CALLV
pop
line 3377
;3377:    Com_sprintf(name_fmt, sizeof(name_fmt), "%%%is", (max_name + strlen(g_admin_bans[i]->name) - strlen(n1)));
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ARGP4
ADDRLP4 392
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 24
ARGP4
ADDRLP4 396
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 196
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $667
ARGP4
ADDRLP4 300
INDIRI4
ADDRLP4 392
INDIRI4
ADDI4
ADDRLP4 396
INDIRI4
SUBI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 3378
;3378:    Com_sprintf(n1, sizeof(n1), name_fmt, g_admin_bans[i]->name);
ADDRLP4 24
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 196
ARGP4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3380
;3379:
;3380:    G_DecolorString(g_admin_bans[i]->banner, n2);
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 G_DecolorString
CALLV
pop
line 3381
;3381:    Com_sprintf(banner_fmt, sizeof(banner_fmt), "%%%is", (max_banner + strlen(g_admin_bans[i]->banner) - strlen(n2)));
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 400
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 88
ARGP4
ADDRLP4 404
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 228
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $667
ARGP4
ADDRLP4 304
INDIRI4
ADDRLP4 400
INDIRI4
ADDI4
ADDRLP4 404
INDIRI4
SUBI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 3382
;3382:    Com_sprintf(n2, sizeof(n2), banner_fmt, g_admin_bans[i]->banner);
ADDRLP4 88
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 228
ARGP4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 3384
;3383:
;3384:    ADMBP(va("%4i %s^7 %-15s %-8s %s^7 %-10s\n     \\__ %s\n", (i + 1), n1,
ADDRGP4 $2094
ARGP4
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 412
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ASGNP4
ADDRLP4 412
INDIRP4
CNSTI4 65
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 412
INDIRP4
CNSTI4 85
ADDP4
ARGP4
ADDRLP4 416
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 416
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3387
;3385:            g_admin_bans[i]->ip, date, n2, duration, g_admin_bans[i]->reason));
;3386:
;3387:    show_count++;
ADDRLP4 152
ADDRLP4 152
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3388
;3388:  }
LABELV $2068
line 3331
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2070
ADDRLP4 20
INDIRI4
CNSTI4 1024
GEI4 $2096
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2096
ADDRLP4 152
INDIRI4
CNSTI4 10
LTI4 $2067
LABELV $2096
line 3390
;3389:
;3390:  if (!numeric || ip_match)
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $2099
ADDRLP4 188
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2097
LABELV $2099
line 3391
;3391:  {
line 3393
;3392:    char matchmethod[50];
;3393:    if (numeric)
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $2100
line 3394
;3394:      Com_sprintf(matchmethod, sizeof(matchmethod), "IP");
ADDRLP4 380
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 $2102
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $2101
JUMPV
LABELV $2100
line 3395
;3395:    else if (!subnetfilter)
ADDRLP4 316
INDIRI4
CNSTI4 0
NEI4 $2103
line 3396
;3396:      Com_sprintf(matchmethod, sizeof(matchmethod), "name");
ADDRLP4 380
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 $785
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $2104
JUMPV
LABELV $2103
line 3398
;3397:    else
;3398:      Com_sprintf(matchmethod, sizeof(matchmethod), "ip range size");
ADDRLP4 380
ARGP4
CNSTI4 50
ARGI4
ADDRGP4 $2105
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $2104
LABELV $2101
line 3400
;3399:
;3400:    ADMBP(va("^3!showbans:^7 found %d matching bans by %s.  ", show_count,
ADDRGP4 $2106
ARGP4
ADDRLP4 152
INDIRI4
ARGI4
ADDRLP4 380
ARGP4
ADDRLP4 432
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 432
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3402
;3401:            matchmethod));
;3402:  }
ADDRGP4 $2098
JUMPV
LABELV $2097
line 3404
;3403:  else
;3404:  {
line 3405
;3405:    ADMBP(va("^3!showbans:^7 showing bans %d - %d of %d.  ", (found) ? (start
ADDRGP4 $2107
ARGP4
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $2110
ADDRLP4 380
ADDRLP4 320
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $2111
JUMPV
LABELV $2110
ADDRLP4 380
CNSTI4 0
ASGNI4
LABELV $2111
ADDRLP4 380
INDIRI4
ARGI4
ADDRLP4 320
INDIRI4
CNSTI4 10
ADDI4
ADDRLP4 312
INDIRI4
LEI4 $2112
ADDRLP4 384
ADDRLP4 312
INDIRI4
ASGNI4
ADDRGP4 $2113
JUMPV
LABELV $2112
ADDRLP4 384
ADDRLP4 320
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
LABELV $2113
ADDRLP4 384
INDIRI4
ARGI4
ADDRLP4 312
INDIRI4
ARGI4
ADDRLP4 388
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 388
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3408
;3406:                + 1) : 0, ((start + MAX_ADMIN_SHOWBANS) > found) ? found : (start
;3407:                + MAX_ADMIN_SHOWBANS), found));
;3408:  }
LABELV $2098
line 3410
;3409:
;3410:  if ((start + MAX_ADMIN_SHOWBANS) < found)
ADDRLP4 320
INDIRI4
CNSTI4 10
ADDI4
ADDRLP4 312
INDIRI4
GEI4 $2114
line 3411
;3411:  {
line 3412
;3412:    ADMBP(va("run !showbans %d %s to see more",
ADDRGP4 $2116
ARGP4
ADDRLP4 320
INDIRI4
CNSTI4 10
ADDI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 156
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2118
ADDRLP4 380
ADDRLP4 156
ASGNP4
ADDRGP4 $2119
JUMPV
LABELV $2118
ADDRLP4 380
ADDRGP4 $93
ASGNP4
LABELV $2119
ADDRLP4 380
INDIRP4
ARGP4
ADDRLP4 384
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 384
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3414
;3413:            (start + MAX_ADMIN_SHOWBANS + 1), (filter[0]) ? filter : ""));
;3414:  }
LABELV $2114
line 3415
;3415:  ADMBP("\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $417
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3416
;3416:  ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 3417
;3417:  return qtrue;
CNSTI4 1
RETI4
LABELV $1999
endproc G_admin_showbans 436 32
export G_reconnectdb
proc G_reconnectdb 0 8
line 3422
;3418:}
;3419:
;3420:qboolean
;3421:G_reconnectdb(gentity_t *ent, int skiparg)
;3422:{
line 3423
;3423:  ADMP("^3!warn: Only use it when mysql server get restarted.\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2121
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3424
;3424:  trap_mysql_reconnect();
ADDRGP4 trap_mysql_reconnect
CALLV
pop
line 3425
;3425:  return qtrue;
CNSTI4 1
RETI4
LABELV $2120
endproc G_reconnectdb 0 8
lit
align 1
LABELV $2123
byte 1 10
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 110
byte 1 111
byte 1 110
byte 1 45
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 47
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 121
byte 1 32
byte 1 97
byte 1 108
byte 1 115
byte 1 111
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 97
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 58
byte 1 32
byte 1 10
byte 1 94
byte 1 51
byte 1 0
skip 952
export G_admin_help
code
proc G_admin_help 1088 12
line 3430
;3426:}
;3427:
;3428:qboolean
;3429:G_admin_help(gentity_t *ent, int skiparg)
;3430:{
line 3432
;3431:  int i;
;3432:  char additional[MAX_STRING_CHARS] = "\nThe following non-standard /commands may also be available to you: \n^3";
ADDRLP4 4
ADDRGP4 $2123
INDIRB
ASGNB 1024
line 3434
;3433:
;3434:  if (G_SayArgc() < 2 + skiparg)
ADDRLP4 1028
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $2124
line 3435
;3435:  {
line 3436
;3436:    int j = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 3437
;3437:    int count = 0;
ADDRLP4 1036
CNSTI4 0
ASGNI4
line 3439
;3438:
;3439:    ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 3440
;3440:    for(i = 0;i < adminNumCmds;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2129
JUMPV
LABELV $2126
line 3441
;3441:    {
line 3442
;3442:      if (G_admin_permission(ent, g_admin_cmds[i].flag))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $2130
line 3443
;3443:      {
line 3444
;3444:        ADMBP(va("^3!%-12s", g_admin_cmds[i].keyword));
ADDRGP4 $2133
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds
ADDP4
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3445
;3445:        j++;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3446
;3446:        count++;
ADDRLP4 1036
ADDRLP4 1036
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3447
;3447:      }
LABELV $2130
line 3449
;3448:      // show 6 commands per line
;3449:      if (j == 6)
ADDRLP4 1032
INDIRI4
CNSTI4 6
NEI4 $2134
line 3450
;3450:      {
line 3451
;3451:        ADMBP("\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $417
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3452
;3452:        j = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 3453
;3453:      }
LABELV $2134
line 3454
;3454:    }
LABELV $2127
line 3440
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2129
ADDRLP4 0
INDIRI4
ADDRGP4 adminNumCmds
INDIRI4
LTI4 $2126
line 3455
;3455:    for(i = 0;i < MAX_ADMIN_COMMANDS && g_admin_commands[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2139
JUMPV
LABELV $2136
line 3456
;3456:    {
line 3457
;3457:      if (!G_admin_permission(ent, g_admin_commands[i]->flag))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CNSTI4 134
ADDP4
ARGP4
ADDRLP4 1040
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $2140
line 3458
;3458:        continue;
ADDRGP4 $2137
JUMPV
LABELV $2140
line 3459
;3459:      ADMBP(va("^3!%-12s", g_admin_commands[i]->command));
ADDRGP4 $2133
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3460
;3460:      j++;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3461
;3461:      count++;
ADDRLP4 1036
ADDRLP4 1036
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3463
;3462:      // show 6 commands per line
;3463:      if (j == 6)
ADDRLP4 1032
INDIRI4
CNSTI4 6
NEI4 $2142
line 3464
;3464:      {
line 3465
;3465:        ADMBP("\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $417
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3466
;3466:        j = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 3467
;3467:      }
LABELV $2142
line 3468
;3468:    }
LABELV $2137
line 3455
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2139
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $2144
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2136
LABELV $2144
line 3470
;3469:
;3470:    if (ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2145
line 3471
;3471:      strcat(additional, " /builder /say_area");
ADDRLP4 4
ARGP4
ADDRGP4 $2147
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $2145
line 3472
;3472:    if (g_publicSayadmins.integer || G_admin_permission(ent, ADMF_ADMINCHAT))
ADDRGP4 g_publicSayadmins+12
INDIRI4
CNSTI4 0
NEI4 $2152
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2151
ARGP4
ADDRLP4 1044
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $2148
LABELV $2152
line 3473
;3473:      strcat(additional, " /a /say_admins");
ADDRLP4 4
ARGP4
ADDRGP4 $2153
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $2148
line 3474
;3474:    if (g_privateMessages.integer)
ADDRGP4 g_privateMessages+12
INDIRI4
CNSTI4 0
EQI4 $2154
line 3475
;3475:      strcat(additional, " /m");
ADDRLP4 4
ARGP4
ADDRGP4 $2157
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $2154
line 3476
;3476:    if (ent && g_actionPrefix.string[0])
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2158
ADDRGP4 g_actionPrefix+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2158
line 3477
;3477:      strcat(additional, " /me /mt /me_team");
ADDRLP4 4
ARGP4
ADDRGP4 $2161
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $2158
line 3478
;3478:    if (ent && g_myStats.integer)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2162
ADDRGP4 g_myStats+12
INDIRI4
CNSTI4 0
EQI4 $2162
line 3479
;3479:      strcat(additional, " /mystats");
ADDRLP4 4
ARGP4
ADDRGP4 $2165
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $2162
line 3480
;3480:    if (ent && ent->client)
ADDRLP4 1048
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
CNSTU4 0
ASGNU4
ADDRLP4 1048
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $2166
ADDRLP4 1048
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $2166
line 3481
;3481:    {
line 3482
;3482:      if (ent->client->pers.designatedBuilder)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2168
line 3483
;3483:      {
line 3484
;3484:        strcat(additional, " /protect /resign");
ADDRLP4 4
ARGP4
ADDRGP4 $2170
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 3485
;3485:      }
LABELV $2168
line 3486
;3486:    }
LABELV $2166
line 3487
;3487:    if (ent && g_allowShare.integer)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2171
ADDRGP4 g_allowShare+12
INDIRI4
CNSTI4 0
EQI4 $2171
line 3488
;3488:      strcat(additional, " /share /donate");
ADDRLP4 4
ARGP4
ADDRGP4 $2174
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $2171
line 3490
;3489:
;3490:    if (count)
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $2175
line 3491
;3491:      ADMBP("\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $417
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
LABELV $2175
line 3492
;3492:    ADMBP(va("^3!help: ^7%i available commands\n", count));
ADDRGP4 $2177
ARGP4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1056
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3493
;3493:    ADMBP("run !help [^3command^7] for help with a specific command.\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2178
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3494
;3494:    ADMBP(va("%s\n", additional));
ADDRGP4 $636
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3495
;3495:    ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 3497
;3496:
;3497:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2122
JUMPV
LABELV $2124
line 3500
;3498:  }
;3499:  else
;3500:  {
line 3505
;3501:    //!help param
;3502:    char param[MAX_ADMIN_CMD_LEN];
;3503:    char *cmd;
;3504:
;3505:    G_SayArgv(1 + skiparg, param, sizeof(param));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3506
;3506:    cmd = (param[0] == '!') ? &param[1] : &param[0];
ADDRLP4 1036
INDIRI1
CVII4 1
CNSTI4 33
NEI4 $2181
ADDRLP4 1056
ADDRLP4 1036+1
ASGNP4
ADDRGP4 $2182
JUMPV
LABELV $2181
ADDRLP4 1056
ADDRLP4 1036
ASGNP4
LABELV $2182
ADDRLP4 1032
ADDRLP4 1056
INDIRP4
ASGNP4
line 3507
;3507:    ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 3508
;3508:    for(i = 0;i < adminNumCmds;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2186
JUMPV
LABELV $2183
line 3509
;3509:    {
line 3510
;3510:      if (!Q_stricmp(cmd, g_admin_cmds[i].keyword))
ADDRLP4 1032
INDIRP4
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds
ADDP4
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $2187
line 3511
;3511:      {
line 3512
;3512:        if (!G_admin_permission(ent, g_admin_cmds[i].flag))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $2189
line 3513
;3513:        {
line 3514
;3514:          ADMBP(va("^3!help: ^7you have no permission to use '%s'\n",
ADDRGP4 $2192
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds
ADDP4
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3516
;3515:                  g_admin_cmds[i].keyword));
;3516:          ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 3517
;3517:          return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2122
JUMPV
LABELV $2189
line 3519
;3518:        }
;3519:        ADMBP(va("^3!help: ^7help for '!%s':\n", g_admin_cmds[i].keyword));
ADDRGP4 $2193
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds
ADDP4
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3520
;3520:        ADMBP(va(" ^3Function: ^7%s\n", g_admin_cmds[i].function));
ADDRGP4 $2194
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds+12
ADDP4
INDIRP4
ARGP4
ADDRLP4 1072
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3521
;3521:        ADMBP(va(" ^3Syntax: ^7!%s %s\n", g_admin_cmds[i].keyword,
ADDRGP4 $2196
ARGP4
ADDRLP4 1076
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 1076
INDIRI4
ADDRGP4 g_admin_cmds
ADDP4
INDIRP4
ARGP4
ADDRLP4 1076
INDIRI4
ADDRGP4 g_admin_cmds+16
ADDP4
INDIRP4
ARGP4
ADDRLP4 1080
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3523
;3522:                g_admin_cmds[i].syntax));
;3523:        ADMBP(va(" ^3Flag: ^7'%s'\n", g_admin_cmds[i].flag));
ADDRGP4 $2198
ARGP4
CNSTI4 20
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_admin_cmds+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 1084
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1084
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3524
;3524:        ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 3525
;3525:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2122
JUMPV
LABELV $2187
line 3527
;3526:      }
;3527:    }
LABELV $2184
line 3508
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2186
ADDRLP4 0
INDIRI4
ADDRGP4 adminNumCmds
INDIRI4
LTI4 $2183
line 3528
;3528:    for(i = 0;i < MAX_ADMIN_COMMANDS && g_admin_commands[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2203
JUMPV
LABELV $2200
line 3529
;3529:    {
line 3530
;3530:      if (!Q_stricmp(cmd, g_admin_commands[i]->command))
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $2204
line 3531
;3531:      {
line 3532
;3532:        if (!G_admin_permission(ent, g_admin_commands[i]->flag))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CNSTI4 134
ADDP4
ARGP4
ADDRLP4 1064
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $2206
line 3533
;3533:        {
line 3534
;3534:          ADMBP(va("^3!help: ^7you have no permission to use '%s'\n",
ADDRGP4 $2192
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3536
;3535:                  g_admin_commands[i]->command));
;3536:          ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 3537
;3537:          return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2122
JUMPV
LABELV $2206
line 3539
;3538:        }
;3539:        ADMBP(va("^3!help: ^7help for '%s':\n", g_admin_commands[i]->command));
ADDRGP4 $2208
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3540
;3540:        ADMBP(va(" ^3Description: ^7%s\n", g_admin_commands[i]->desc));
ADDRGP4 $2209
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CNSTI4 84
ADDP4
ARGP4
ADDRLP4 1072
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3541
;3541:        ADMBP(va(" ^3Syntax: ^7!%s\n", g_admin_commands[i]->command));
ADDRGP4 $2210
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3542
;3542:        ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 3543
;3543:        return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2122
JUMPV
LABELV $2204
line 3545
;3544:      }
;3545:    }
LABELV $2201
line 3528
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2203
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $2211
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2200
LABELV $2211
line 3546
;3546:    ADMBP(va("^3!help: ^7no help found for '%s'\n", cmd));
ADDRGP4 $2212
ARGP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 3547
;3547:    ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 3548
;3548:    return qfalse;
CNSTI4 0
RETI4
LABELV $2122
endproc G_admin_help 1088 12
export G_admin_admintest
proc G_admin_admintest 40 24
line 3554
;3549:  }
;3550:}
;3551:
;3552:qboolean
;3553:G_admin_admintest(gentity_t *ent, int skiparg)
;3554:{
line 3555
;3555:  int i, l = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3556
;3556:  qboolean found = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 3557
;3557:  qboolean lname = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 3559
;3558:
;3559:  if (!ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2214
line 3560
;3560:  {
line 3561
;3561:    ADMP("^3!admintest: ^7you are on the console.\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2216
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3562
;3562:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2213
JUMPV
LABELV $2214
line 3564
;3563:  }
;3564:  for(i = 0;i < MAX_ADMIN_ADMINS && g_admin_admins[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2220
JUMPV
LABELV $2217
line 3565
;3565:  {
line 3566
;3566:    if (!Q_stricmp(g_admin_admins[i]->guid, ent->client->pers.guid))
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $2221
line 3567
;3567:    {
line 3568
;3568:      found = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 3569
;3569:      break;
ADDRGP4 $2219
JUMPV
LABELV $2221
line 3571
;3570:    }
;3571:  }
LABELV $2218
line 3564
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2220
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $2223
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2217
LABELV $2223
LABELV $2219
line 3573
;3572:
;3573:  if (found)
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $2224
line 3574
;3574:  {
line 3575
;3575:    l = g_admin_admins[i]->level;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 3576
;3576:    for(i = 0;i < MAX_ADMIN_LEVELS && g_admin_levels[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2229
JUMPV
LABELV $2226
line 3577
;3577:    {
line 3578
;3578:      if (g_admin_levels[i]->level != l)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2230
line 3579
;3579:        continue;
ADDRGP4 $2227
JUMPV
LABELV $2230
line 3580
;3580:      if (*g_admin_levels[i]->name)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2232
line 3581
;3581:      {
line 3582
;3582:        lname = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 3583
;3583:        break;
ADDRGP4 $2228
JUMPV
LABELV $2232
line 3585
;3584:      }
;3585:    }
LABELV $2227
line 3576
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2229
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $2234
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2226
LABELV $2234
LABELV $2228
line 3586
;3586:  }
LABELV $2224
line 3587
;3587:  AP(va("print \"^3!admintest: ^7%s^7 is a level %d admin %s%s^7%s\n\"",
ADDRGP4 $2235
ARGP4
ADDRLP4 32
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2240
ADDRLP4 20
ADDRGP4 $2236
ASGNP4
ADDRGP4 $2241
JUMPV
LABELV $2240
ADDRLP4 20
ADDRGP4 $93
ASGNP4
LABELV $2241
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2242
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRGP4 $2243
JUMPV
LABELV $2242
ADDRLP4 24
ADDRGP4 $93
ASGNP4
LABELV $2243
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2244
ADDRLP4 28
ADDRGP4 $1918
ASGNP4
ADDRGP4 $2245
JUMPV
LABELV $2244
ADDRLP4 28
ADDRGP4 $93
ASGNP4
LABELV $2245
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3590
;3588:          ent->client->pers.netname, l, (lname) ? "(" : "",
;3589:          (lname) ? g_admin_levels[i]->name : "", (lname) ? ")" : ""));
;3590:  return qtrue;
CNSTI4 1
RETI4
LABELV $2213
endproc G_admin_admintest 40 24
export G_set_survival_stage
proc G_set_survival_stage 48 12
line 3595
;3591:}
;3592:
;3593:qboolean
;3594:G_set_survival_stage(gentity_t *ent, int skiparg)
;3595:{
line 3598
;3596:  char stage[MAX_NAME_LENGTH];
;3597:
;3598:  if (G_SayArgc() < 2 + skiparg)
ADDRLP4 32
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $2247
line 3599
;3599:  {
line 3600
;3600:    AP(va("print \"^3Survival Stage: %d\n\"", level.survivalStage));
ADDRGP4 $2249
ARGP4
ADDRGP4 level+173912
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3601
;3601:    AP(va("cp \"^3Survival Stage: %d\n\"", level.survivalStage));
ADDRGP4 $2251
ARGP4
ADDRGP4 level+173912
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3602
;3602:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2246
JUMPV
LABELV $2247
line 3604
;3603:  }
;3604:  {
line 3605
;3605:    G_SayArgv(1 + skiparg, stage, sizeof(stage));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3606
;3606:    level.survivalStage = atoi(stage);
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 level+173912
ADDRLP4 36
INDIRI4
ASGNI4
line 3607
;3607:    AP(va("print \"^3Survival Stage: %d\n\"", level.survivalStage));
ADDRGP4 $2249
ARGP4
ADDRGP4 level+173912
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3608
;3608:    AP(va("cp \"^3Survival Stage: %d\n\"", level.survivalStage));
ADDRGP4 $2251
ARGP4
ADDRGP4 level+173912
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3609
;3609:    return qtrue;
CNSTI4 1
RETI4
LABELV $2246
endproc G_set_survival_stage 48 12
export G_admin_switch
proc G_admin_switch 8 8
line 3615
;3610:  }
;3611:}
;3612:
;3613:qboolean
;3614:G_admin_switch(gentity_t *ent, int skiparg)
;3615:{
line 3616
;3616:  if (!ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2257
line 3617
;3617:  {
line 3618
;3618:    ADMP("^3!admintest: ^7you are on the console.\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2216
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3619
;3619:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2256
JUMPV
LABELV $2257
line 3621
;3620:  }
;3621:  if (ent->client->ps.stats[STAT_PTEAM] == PTE_HUMANS)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2259
line 3622
;3622:  {
line 3623
;3623:    ent->client->ps.stats[STAT_PTEAM] = PTE_ALIENS;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 1
ASGNI4
line 3624
;3624:  }
ADDRGP4 $2260
JUMPV
LABELV $2259
line 3626
;3625:  else
;3626:  {
line 3627
;3627:    ent->client->ps.stats[STAT_PTEAM] = PTE_HUMANS;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 216
ADDP4
CNSTI4 2
ASGNI4
line 3628
;3628:  }
LABELV $2260
line 3630
;3629:
;3630:  AP(va("print \"^3!admintest: ^7%s^7 Switched teams\n\"",
ADDRGP4 $2261
ARGP4
ADDRLP4 0
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3632
;3631:          ent->client->pers.netname));
;3632:  return qtrue;
CNSTI4 1
RETI4
LABELV $2256
endproc G_admin_switch 8 8
export G_admin_allready
proc G_admin_allready 20 8
line 3637
;3633:}
;3634:
;3635:qboolean
;3636:G_admin_allready(gentity_t *ent, int skiparg)
;3637:{
line 3638
;3638:  int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 3641
;3639:  gclient_t *cl;
;3640:
;3641:  if (!level.intermissiontime)
ADDRGP4 level+185040
INDIRI4
CNSTI4 0
NEI4 $2263
line 3642
;3642:  {
line 3643
;3643:    ADMP("^3!allready: ^7this command is only valid during intermission\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2266
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3644
;3644:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2262
JUMPV
LABELV $2263
line 3647
;3645:  }
;3646:
;3647:  for(i = 0;i < g_maxclients.integer;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2270
JUMPV
LABELV $2267
line 3648
;3648:  {
line 3649
;3649:    cl = level.clients + i;
ADDRLP4 0
CNSTI4 2148
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 3650
;3650:    if (cl->pers.connected != CON_CONNECTED)
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $2272
line 3651
;3651:      continue;
ADDRGP4 $2268
JUMPV
LABELV $2272
line 3653
;3652:
;3653:    if (cl->pers.teamSelection == PTE_NONE)
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2274
line 3654
;3654:      continue;
ADDRGP4 $2268
JUMPV
LABELV $2274
line 3656
;3655:
;3656:    cl->readyToExit = 1;
ADDRLP4 0
INDIRP4
CNSTI4 1160
ADDP4
CNSTI4 1
ASGNI4
line 3657
;3657:  }
LABELV $2268
line 3647
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2270
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $2267
line 3658
;3658:  AP(va("print \"^3!allready:^7 %s^7 says everyone is READY now\n\"",
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2278
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
ADDRGP4 $2279
JUMPV
LABELV $2278
ADDRLP4 8
ADDRGP4 $342
ASGNP4
LABELV $2279
ADDRGP4 $2276
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 3660
;3659:          (ent) ? G_admin_adminPrintName(ent) : "console"));
;3660:  return qtrue;
CNSTI4 1
RETI4
LABELV $2262
endproc G_admin_allready 20 8
export G_admin_printgrid
proc G_admin_printgrid 48 8
line 3665
;3661:}
;3662:
;3663:qboolean
;3664:G_admin_printgrid(gentity_t *ent, int skiparg)
;3665:{
line 3666
;3666:  gentity_t *node = NULL;
ADDRLP4 16
CNSTP4 0
ASGNP4
line 3673
;3667:  int x, y;
;3668:  int xp, yp;
;3669:  int xnode, ynode;
;3670:  int i;
;3671:  //ADMBP_begin();
;3672:
;3673:  xp = ((BLOCKSIZE / 2) + (ent->s.origin[0] / BLOCKSIZE));
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
CNSTF4 1120403456
DIVF4
CNSTF4 1112014848
ADDF4
CVFI4 4
ASGNI4
line 3674
;3674:  yp = ((BLOCKSIZE / 2) + (ent->s.origin[1] / BLOCKSIZE));
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
CNSTF4 1120403456
DIVF4
CNSTF4 1112014848
ADDF4
CVFI4 4
ASGNI4
line 3676
;3675:
;3676:  for(i = MAX_CLIENTS;i < level.num_entities;i++)
ADDRLP4 28
CNSTI4 64
ASGNI4
ADDRGP4 $2284
JUMPV
LABELV $2281
line 3677
;3677:  {
line 3678
;3678:    node = &level.gentities[i];
ADDRLP4 16
CNSTI4 2476
ADDRLP4 28
INDIRI4
MULI4
ADDRGP4 level+4
INDIRP4
ADDP4
ASGNP4
line 3679
;3679:    if (node->health <= 0)
ADDRLP4 16
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $2287
line 3680
;3680:      continue;
ADDRGP4 $2282
JUMPV
LABELV $2287
line 3681
;3681:    if (node->s.eType != ET_BUILDABLE)
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $2289
line 3682
;3682:      continue;
ADDRGP4 $2282
JUMPV
LABELV $2289
line 3683
;3683:    if (node->biteam != BIT_HUMANS)
ADDRLP4 16
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 2
EQI4 $2291
line 3684
;3684:      continue;
ADDRGP4 $2282
JUMPV
LABELV $2291
line 3685
;3685:    if (node->s.modelindex != BA_H_SPAWN)
ADDRLP4 16
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 9
EQI4 $2283
line 3686
;3686:      continue;
line 3688
;3687:
;3688:    break;
LABELV $2282
line 3676
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2284
ADDRLP4 28
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $2281
LABELV $2283
line 3690
;3689:  }
;3690:  if (!node)
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2295
line 3691
;3691:  {
line 3692
;3692:    G_LogPrintf("No nodes.\n");
ADDRGP4 $2297
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 3693
;3693:  }
LABELV $2295
line 3694
;3694:  xnode = ((BLOCKSIZE / 2) + (node->s.origin[0] / BLOCKSIZE));
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
CNSTF4 1120403456
DIVF4
CNSTF4 1112014848
ADDF4
CVFI4 4
ASGNI4
line 3695
;3695:  ynode = ((BLOCKSIZE / 2) + (node->s.origin[1] / BLOCKSIZE));
ADDRLP4 24
ADDRLP4 16
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
CNSTF4 1120403456
DIVF4
CNSTF4 1112014848
ADDF4
CVFI4 4
ASGNI4
line 3697
;3696:  //Prevent buffer overflow.
;3697:  if (xnode >= GRIDSIZE || ynode >= GRIDSIZE || xnode < 0 || ynode < 0)
ADDRLP4 36
CNSTI4 120
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 36
INDIRI4
GEI4 $2302
ADDRLP4 24
INDIRI4
ADDRLP4 36
INDIRI4
GEI4 $2302
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 44
INDIRI4
LTI4 $2302
ADDRLP4 24
INDIRI4
ADDRLP4 44
INDIRI4
GEI4 $2298
LABELV $2302
line 3698
;3698:  {
line 3699
;3699:    G_LogPrintf("Node out of the path map.\n");
ADDRGP4 $2303
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 3700
;3700:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2280
JUMPV
LABELV $2298
line 3703
;3701:  }
;3702:
;3703:  for(x = 0;x < GRIDSIZE;x++)
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $2304
line 3704
;3704:  {
line 3705
;3705:    for(y = 0;y < GRIDSIZE;y++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2308
line 3706
;3706:    {
line 3707
;3707:      if (x == xp && y == yp)
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $2312
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $2312
line 3708
;3708:      {
line 3709
;3709:        G_LogPrintf("%i", 7);
ADDRGP4 $2314
ARGP4
CNSTI4 7
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 3710
;3710:      }
ADDRGP4 $2313
JUMPV
LABELV $2312
line 3711
;3711:      else if (x == xnode && y == ynode)
ADDRLP4 4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $2315
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $2315
line 3712
;3712:      {
line 3713
;3713:        G_LogPrintf("%i", 3);
ADDRGP4 $2314
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 3714
;3714:      }
ADDRGP4 $2316
JUMPV
LABELV $2315
line 3716
;3715:      else
;3716:      {
line 3717
;3717:        if (level.grid[x][y] == 1)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 480
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level+96
ADDP4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2317
line 3718
;3718:        {
line 3719
;3719:          G_LogPrintf(".", level.grid[x][y]);
ADDRGP4 $2320
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 480
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level+96
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 3720
;3720:        }
ADDRGP4 $2318
JUMPV
LABELV $2317
line 3722
;3721:        else
;3722:        {
line 3723
;3723:          G_LogPrintf("*", level.grid[x][y]);
ADDRGP4 $2322
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 480
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level+96
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 3724
;3724:        }
LABELV $2318
line 3725
;3725:      }
LABELV $2316
LABELV $2313
line 3726
;3726:    }
LABELV $2309
line 3705
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 120
LTI4 $2308
line 3727
;3727:    G_LogPrintf("\n");
ADDRGP4 $417
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 3729
;3728:    //ADMBP(va("\n"));
;3729:  }
LABELV $2305
line 3703
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 120
LTI4 $2304
line 3730
;3730:  return qtrue;
CNSTI4 1
RETI4
LABELV $2280
endproc G_admin_printgrid 48 8
export G_admin_printpath
proc G_admin_printpath 8 8
line 3736
;3731:  //ADMBP_end();
;3732:}
;3733:
;3734:qboolean
;3735:G_admin_printpath(gentity_t *ent, int skiparg)
;3736:{
line 3740
;3737:  int x, y;
;3738:  //ADMBP_begin();
;3739:
;3740:  for(x = 0;x < GRIDSIZE;x++)
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $2325
line 3741
;3741:  {
line 3742
;3742:    for(y = 0;y < GRIDSIZE;y++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2329
line 3743
;3743:    {
line 3744
;3744:      G_LogPrintf("%i", level.path[y][x]);
ADDRGP4 $2314
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 480
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level+115296
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 3746
;3745:      //ADMBP(va("%d", level.grid[y][x]));
;3746:    }
LABELV $2330
line 3742
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 120
LTI4 $2329
line 3747
;3747:    G_LogPrintf("\n");
ADDRGP4 $417
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 3749
;3748:    //ADMBP(va("\n"));
;3749:  }
LABELV $2326
line 3740
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 120
LTI4 $2325
line 3750
;3750:  return qtrue;
CNSTI4 1
RETI4
LABELV $2324
endproc G_admin_printpath 8 8
export G_admin_findpath
proc G_admin_findpath 8 4
line 3756
;3751:  //ADMBP_end();
;3752:}
;3753:
;3754:qboolean
;3755:G_admin_findpath(gentity_t *ent, int skiparg)
;3756:{
line 3760
;3757:  int i;
;3758:  gentity_t *bot;
;3759:
;3760:  for(i = 0;i < level.numConnectedClients;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2338
JUMPV
LABELV $2335
line 3761
;3761:  {
line 3762
;3762:    bot = &g_entities[level.sortedClients[i]];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+173952
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 3763
;3763:    if (!bot)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2341
line 3764
;3764:      continue;
ADDRGP4 $2336
JUMPV
LABELV $2341
line 3765
;3765:    if (!bot->client)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2343
line 3766
;3766:      continue;
ADDRGP4 $2336
JUMPV
LABELV $2343
line 3767
;3767:    if (!(bot->r.svFlags & SVF_BOT))
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $2345
line 3768
;3768:      continue;
ADDRGP4 $2336
JUMPV
LABELV $2345
line 3770
;3769:
;3770:    ACESP_SetupBotState(bot);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ACESP_SetupBotState
CALLV
pop
line 3771
;3771:    bot->botCommand = BOT_FOLLOW_PATH;
ADDRLP4 0
INDIRP4
CNSTI4 904
ADDP4
CNSTI4 11
ASGNI4
line 3772
;3772:    bot->botMetaMode = ATTACK_ALL;
ADDRLP4 0
INDIRP4
CNSTI4 936
ADDP4
CNSTI4 3
ASGNI4
line 3773
;3773:    bot->botEnemy = ent;
ADDRLP4 0
INDIRP4
CNSTI4 908
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 3774
;3774:    bot->bs.goalEntity = ent;
ADDRLP4 0
INDIRP4
CNSTI4 2384
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 3775
;3775:    bot->bs.moveTarget = ent;
ADDRLP4 0
INDIRP4
CNSTI4 2380
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 3776
;3776:  }
LABELV $2336
line 3760
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2338
ADDRLP4 4
INDIRI4
ADDRGP4 level+173940
INDIRI4
LTI4 $2335
line 3777
;3777:  return qtrue;
CNSTI4 1
RETI4
LABELV $2334
endproc G_admin_findpath 8 4
export G_switchnodes
proc G_switchnodes 12 0
line 3782
;3778:}
;3779:
;3780:qboolean
;3781:G_switchnodes(gentity_t *ent, int skiparg)
;3782:{
line 3786
;3783:  int i;
;3784:  gentity_t *ent2;
;3785:
;3786:  for(i = MAX_CLIENTS;i < level.num_entities;i++)
ADDRLP4 4
CNSTI4 64
ASGNI4
ADDRGP4 $2351
JUMPV
LABELV $2348
line 3787
;3787:  {
line 3788
;3788:    ent2 = &level.gentities[i];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level+4
INDIRP4
ADDP4
ASGNP4
line 3789
;3789:    if (ent2->health <= 0)
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
GTI4 $2354
line 3790
;3790:      continue;
ADDRGP4 $2349
JUMPV
LABELV $2354
line 3791
;3791:    if (ent2->s.eType != ET_BUILDABLE)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $2356
line 3792
;3792:      continue;
ADDRGP4 $2349
JUMPV
LABELV $2356
line 3793
;3793:    if (ent2->biteam != BIT_ALIENS)
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
INDIRI4
CNSTI4 1
EQI4 $2358
line 3794
;3794:      continue;
ADDRGP4 $2349
JUMPV
LABELV $2358
line 3795
;3795:    if (ent2->s.modelindex != BA_H_SPAWN)
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 9
EQI4 $2360
line 3796
;3796:      continue;
ADDRGP4 $2349
JUMPV
LABELV $2360
line 3798
;3797:
;3798:    ent2->s.eFlags ^= EF_NODRAW;
ADDRLP4 8
ADDRLP4 0
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
BXORI4
ASGNI4
line 3799
;3799:  }
LABELV $2349
line 3786
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2351
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $2348
line 3800
;3800:  return qtrue;
CNSTI4 1
RETI4
LABELV $2347
endproc G_switchnodes 12 0
export G_setnextnode
proc G_setnextnode 0 0
line 3804
;3801:}
;3802:qboolean
;3803:G_setnextnode(gentity_t *ent, int skiparg)
;3804:{
line 3805
;3805:  return qtrue;
CNSTI4 1
RETI4
LABELV $2362
endproc G_setnextnode 0 0
export G_drawnodes
proc G_drawnodes 8 12
line 3811
;3806:}
;3807:
;3808:
;3809:qboolean
;3810:G_drawnodes(gentity_t *ent, int skiparg)
;3811:{
line 3813
;3812:  int x, y;
;3813:  for(x = 0;x < GRIDSIZE;x++)
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $2364
line 3814
;3814:  {
line 3815
;3815:    for(y = 0;y < GRIDSIZE;y++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2368
line 3816
;3816:    {
line 3817
;3817:      if (level.grid[x][y] == 1)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 480
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level+96
ADDP4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2372
line 3818
;3818:      {
line 3819
;3819:        spawnGridNode(ent, x, y);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 spawnGridNode
CALLV
pop
line 3820
;3820:      }
LABELV $2372
line 3821
;3821:    }
LABELV $2369
line 3815
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 120
LTI4 $2368
line 3822
;3822:  }
LABELV $2365
line 3813
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 120
LTI4 $2364
line 3823
;3823:  ADMP("^1Drawed Grid Nodes, Will Dissapear in 10 Seconds.\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2375
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3824
;3824:  return qtrue;
CNSTI4 1
RETI4
LABELV $2363
endproc G_drawnodes 8 12
export G_admin_bot
proc G_admin_bot 172 16
line 3829
;3825:}
;3826:
;3827:qboolean
;3828:G_admin_bot(gentity_t *ent, int skiparg)
;3829:{
line 3843
;3830:  // add [name] (team) (skill)
;3831:  // del [name]
;3832:  int minargc;
;3833:
;3834:  char command[10];
;3835:  char name[MAX_NAME_LENGTH];
;3836:  char name_s[MAX_NAME_LENGTH];
;3837:  //char name2[ MAX_NAME_LENGTH ];
;3838:  char name2_s[MAX_NAME_LENGTH];
;3839:  char team[10];
;3840:  int team_int;
;3841:  char skill[2];
;3842:  int skill_int;
;3843:  qboolean success = qfalse;
ADDRLP4 72
CNSTI4 0
ASGNI4
line 3852
;3844:  int i, j;
;3845:
;3846:  //char s2[ MAX_NAME_LENGTH ];
;3847:  //char n2[ MAX_NAME_LENGTH ];
;3848:  //int logmatch = -1, logmatches = 0;
;3849:  //int i, j;
;3850:  //qboolean exactmatch = qfalse;
;3851:
;3852:  minargc = 3 + skiparg;
ADDRLP4 76
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 3853
;3853:  if (G_SayArgc() < minargc)
ADDRLP4 144
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
ADDRLP4 76
INDIRI4
GEI4 $2377
line 3854
;3854:  {
line 3855
;3855:    ADMP("^7Please have at least command and name.\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2379
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3856
;3856:    ADMP("^3!bot: ^7usage: !bot [add/del] [name] (team) (skill)\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2380
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3857
;3857:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2376
JUMPV
LABELV $2377
line 3860
;3858:  }
;3859:
;3860:  G_SayArgv(1 + skiparg, command, sizeof(command));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 80
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3861
;3861:  G_SayArgv(2 + skiparg, name, sizeof(name));
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 90
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3863
;3862:  //G_SanitiseName( name, name_s );
;3863:  G_SanitiseString(name, name_s, sizeof(name_s));
ADDRLP4 90
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 3865
;3864:
;3865:  if (!Q_stricmp(command, "add"))
ADDRLP4 80
ARGP4
ADDRGP4 $2383
ARGP4
ADDRLP4 148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $2381
line 3866
;3866:  {
line 3868
;3867:    // add [name] [team] (skill)
;3868:    minargc = 4 + skiparg;
ADDRLP4 76
ADDRFP4 4
INDIRI4
CNSTI4 4
ADDI4
ASGNI4
line 3869
;3869:    if (G_SayArgc() < minargc)
ADDRLP4 152
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
ADDRLP4 76
INDIRI4
GEI4 $2384
line 3870
;3870:    {
line 3871
;3871:      ADMP("^7Please have at least name and team.\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2386
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3872
;3872:      ADMP("^3!bot: ^7usage: !bot [add/del] [name] [humans/aliens] (skill)\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2387
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3873
;3873:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2376
JUMPV
LABELV $2384
line 3876
;3874:    }
;3875:
;3876:    G_SayArgv(3 + skiparg, team, sizeof(team));
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRLP4 122
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3878
;3877:
;3878:    if (!Q_stricmp(team, "humans"))
ADDRLP4 122
ARGP4
ADDRGP4 $1515
ARGP4
ADDRLP4 156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
NEI4 $2388
line 3879
;3879:    {
line 3880
;3880:      team_int = PTE_HUMANS;
ADDRLP4 136
CNSTI4 2
ASGNI4
line 3881
;3881:    }
ADDRGP4 $2389
JUMPV
LABELV $2388
line 3882
;3882:    else if (!Q_stricmp(team, "aliens"))
ADDRLP4 122
ARGP4
ADDRGP4 $1513
ARGP4
ADDRLP4 160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $2390
line 3883
;3883:    {
line 3884
;3884:      team_int = PTE_ALIENS;
ADDRLP4 136
CNSTI4 1
ASGNI4
line 3885
;3885:    }
ADDRGP4 $2391
JUMPV
LABELV $2390
line 3887
;3886:    else
;3887:    {
line 3888
;3888:      ADMP("^7Invalid bot team.\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2392
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3889
;3889:      ADMP("^3!bot: ^7usage: !bot add [name] [humans/aliens] (skill)\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2393
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3890
;3890:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2376
JUMPV
LABELV $2391
LABELV $2389
line 3893
;3891:    }
;3892:
;3893:    minargc = 5 + skiparg;
ADDRLP4 76
ADDRFP4 4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 3894
;3894:    if (G_SayArgc() < minargc)
ADDRLP4 164
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
ADDRLP4 76
INDIRI4
GEI4 $2394
line 3895
;3895:    {
line 3896
;3896:      skill_int = 0;
ADDRLP4 132
CNSTI4 0
ASGNI4
line 3897
;3897:    }
ADDRGP4 $2395
JUMPV
LABELV $2394
line 3899
;3898:    else
;3899:    {
line 3900
;3900:      G_SayArgv(4 + skiparg, skill, sizeof(skill));
ADDRFP4 4
INDIRI4
CNSTI4 4
ADDI4
ARGI4
ADDRLP4 140
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3901
;3901:      skill_int = atoi(skill);
ADDRLP4 140
ARGP4
ADDRLP4 168
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 132
ADDRLP4 168
INDIRI4
ASGNI4
line 3902
;3902:    }
LABELV $2395
line 3905
;3903:
;3904:    // got name, team_int and skill_int
;3905:    G_BotAdd(name, team_int, skill_int, NULL);
ADDRLP4 90
ARGP4
ADDRLP4 136
INDIRI4
ARGI4
ADDRLP4 132
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 G_BotAdd
CALLV
pop
line 3906
;3906:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2376
JUMPV
LABELV $2381
line 3908
;3907:  }
;3908:  else if (!Q_stricmp(command, "del"))
ADDRLP4 80
ARGP4
ADDRGP4 $2398
ARGP4
ADDRLP4 152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $2396
line 3909
;3909:  {
line 3911
;3910:    // del [name]
;3911:    success = qfalse;
ADDRLP4 72
CNSTI4 0
ASGNI4
line 3912
;3912:    for(i = 0;i < MAX_ADMIN_NAMELOGS && g_admin_namelog[i];i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2402
JUMPV
LABELV $2399
line 3913
;3913:    {
line 3914
;3914:      if (g_admin_namelog[i]->slot >= 0)
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 0
LTI4 $2403
line 3915
;3915:      {
line 3916
;3916:        for(j = 0;j < MAX_ADMIN_NAMELOG_NAMES && g_admin_namelog[i]->name[j][0];j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2408
JUMPV
LABELV $2405
line 3917
;3917:        {
line 3919
;3918:          //G_SanitiseName(g_admin_namelog[ i ]->name[ j ], name2_s);
;3919:          G_SanitiseString(g_admin_namelog[i]->name[j], name2_s, sizeof(name2_s));
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 3920
;3920:          if (strstr(name2_s, name_s))
ADDRLP4 8
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 156
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 156
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2409
line 3921
;3921:          {
line 3922
;3922:            G_BotDel(g_admin_namelog[i]->slot);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_BotDel
CALLV
pop
line 3923
;3923:            success = qtrue;
ADDRLP4 72
CNSTI4 1
ASGNI4
line 3924
;3924:          }
LABELV $2409
line 3925
;3925:        }
LABELV $2406
line 3916
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2408
ADDRLP4 160
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 160
INDIRI4
GEI4 $2411
ADDRLP4 0
INDIRI4
ADDRLP4 160
INDIRI4
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2405
LABELV $2411
line 3926
;3926:      }
LABELV $2403
line 3927
;3927:    }
LABELV $2400
line 3912
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2402
ADDRLP4 4
INDIRI4
CNSTI4 128
GEI4 $2412
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2399
LABELV $2412
line 3929
;3928:
;3929:    return success;
ADDRLP4 72
INDIRI4
RETI4
ADDRGP4 $2376
JUMPV
LABELV $2396
line 3934
;3930:    //ADMP( "delete not implemented yet\n" );
;3931:    //return qfalse;
;3932:  }
;3933:
;3934:  ADMP("^3!bot: ^7usage: !bot [add/del] [name] (team) (skill)\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2380
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3935
;3935:  return qfalse;
CNSTI4 0
RETI4
LABELV $2376
endproc G_admin_bot 172 16
export G_admin_botcmd
proc G_admin_botcmd 156 12
line 3940
;3936:}
;3937:
;3938:qboolean
;3939:G_admin_botcmd(gentity_t *ent, int skiparg)
;3940:{
line 3947
;3941:  int minargc;
;3942:  char name[MAX_NAME_LENGTH];
;3943:  char name_s[MAX_NAME_LENGTH];
;3944:  char name2_s[MAX_NAME_LENGTH];
;3945:  char command[32];
;3946:  int i, j;
;3947:  qboolean success = qfalse;
ADDRLP4 72
CNSTI4 0
ASGNI4
line 3950
;3948:
;3949:  //[botname] [command]
;3950:  minargc = 3 + skiparg;
ADDRLP4 140
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 3951
;3951:  if (G_SayArgc() < minargc)
ADDRLP4 144
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
ADDRLP4 140
INDIRI4
GEI4 $2414
line 3952
;3952:  {
line 3953
;3953:    ADMP("^3!botcmd: ^7usage: !botcmd [botname] [command]\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2416
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3954
;3954:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2413
JUMPV
LABELV $2414
line 3957
;3955:  }
;3956:
;3957:  G_SayArgv(1 + skiparg, name, sizeof(name));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 108
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3958
;3958:  G_SayArgv(2 + skiparg, command, sizeof(command));
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 76
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 3960
;3959:  //G_SanitiseName( name, name_s );
;3960:  G_SanitiseString(name, name_s, sizeof(name_s));
ADDRLP4 108
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 3962
;3961:
;3962:  success = qfalse;
ADDRLP4 72
CNSTI4 0
ASGNI4
line 3963
;3963:  for(i = 0;i < MAX_ADMIN_NAMELOGS && g_admin_namelog[i];i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2420
JUMPV
LABELV $2417
line 3964
;3964:  {
line 3965
;3965:    if (g_admin_namelog[i]->slot >= 0)
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 0
LTI4 $2421
line 3966
;3966:    {
line 3967
;3967:      for(j = 0;j < MAX_ADMIN_NAMELOG_NAMES && g_admin_namelog[i]->name[j][0];j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2426
JUMPV
LABELV $2423
line 3968
;3968:      {
line 3970
;3969:        //G_SanitiseName(g_admin_namelog[ i ]->name[ j ], name2_s);
;3970:        G_SanitiseString(g_admin_namelog[i]->name[j], name2_s, sizeof(name2_s));
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 3971
;3971:        if (strstr(name2_s, name_s))
ADDRLP4 8
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 148
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 148
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2427
line 3972
;3972:        {
line 3973
;3973:          G_BotCmd(ent, g_admin_namelog[i]->slot, command);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ARGP4
ADDRGP4 G_BotCmd
CALLV
pop
line 3974
;3974:          success = qtrue;
ADDRLP4 72
CNSTI4 1
ASGNI4
line 3975
;3975:        }
LABELV $2427
line 3976
;3976:      }
LABELV $2424
line 3967
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2426
ADDRLP4 152
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 152
INDIRI4
GEI4 $2429
ADDRLP4 0
INDIRI4
ADDRLP4 152
INDIRI4
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2423
LABELV $2429
line 3977
;3977:    }
LABELV $2421
line 3978
;3978:  }
LABELV $2418
line 3963
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2420
ADDRLP4 4
INDIRI4
CNSTI4 128
GEI4 $2430
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2417
LABELV $2430
line 3980
;3979:
;3980:  return success;
ADDRLP4 72
INDIRI4
RETI4
LABELV $2413
endproc G_admin_botcmd 156 12
export G_admin_cancelvote
proc G_admin_cancelvote 16 8
line 3985
;3981:}
;3982:
;3983:qboolean
;3984:G_admin_cancelvote(gentity_t *ent, int skiparg)
;3985:{
line 3987
;3986:
;3987:  if (!level.voteTime && !level.teamVoteTime[0] && !level.teamVoteTime[1])
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 level+176268
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $2432
ADDRGP4 level+180384
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $2432
ADDRGP4 level+180384+4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $2432
line 3988
;3988:  {
line 3989
;3989:    ADMP("^3!cancelvote^7: no vote in progress\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2438
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 3990
;3990:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2431
JUMPV
LABELV $2432
line 3992
;3991:  }
;3992:  level.voteNo = level.numConnectedClients;
ADDRGP4 level+176280
ADDRGP4 level+173940
INDIRI4
ASGNI4
line 3993
;3993:  level.voteYes = 0;
ADDRGP4 level+176276
CNSTI4 0
ASGNI4
line 3994
;3994:  CheckVote();
ADDRGP4 CheckVote
CALLV
pop
line 3995
;3995:  level.teamVoteNo[0] = level.numConnectedClients;
ADDRGP4 level+180400
ADDRGP4 level+173940
INDIRI4
ASGNI4
line 3996
;3996:  level.teamVoteYes[0] = 0;
ADDRGP4 level+180392
CNSTI4 0
ASGNI4
line 3997
;3997:  CheckTeamVote(PTE_HUMANS);
CNSTI4 2
ARGI4
ADDRGP4 CheckTeamVote
CALLV
pop
line 3998
;3998:  level.teamVoteNo[1] = level.numConnectedClients;
ADDRGP4 level+180400+4
ADDRGP4 level+173940
INDIRI4
ASGNI4
line 3999
;3999:  level.teamVoteYes[1] = 0;
ADDRGP4 level+180392+4
CNSTI4 0
ASGNI4
line 4000
;4000:  CheckTeamVote(PTE_ALIENS);
CNSTI4 1
ARGI4
ADDRGP4 CheckTeamVote
CALLV
pop
line 4001
;4001:  AP(va("print \"^3!cancelvote: ^7%s^7 decided that everyone voted No\n\"",
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2452
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $2453
JUMPV
LABELV $2452
ADDRLP4 4
ADDRGP4 $342
ASGNP4
LABELV $2453
ADDRGP4 $2450
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4003
;4002:          (ent) ? G_admin_adminPrintName(ent) : "console"));
;4003:  return qtrue;
CNSTI4 1
RETI4
LABELV $2431
endproc G_admin_cancelvote 16 8
export G_admin_passvote
proc G_admin_passvote 16 8
line 4008
;4004:}
;4005:
;4006:qboolean
;4007:G_admin_passvote(gentity_t *ent, int skiparg)
;4008:{
line 4009
;4009:  if (!level.voteTime && !level.teamVoteTime[0] && !level.teamVoteTime[1])
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 level+176268
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $2455
ADDRGP4 level+180384
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $2455
ADDRGP4 level+180384+4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $2455
line 4010
;4010:  {
line 4011
;4011:    ADMP("^3!passvote^7: no vote in progress\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2461
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4012
;4012:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2454
JUMPV
LABELV $2455
line 4014
;4013:  }
;4014:  level.voteYes = level.numConnectedClients;
ADDRGP4 level+176276
ADDRGP4 level+173940
INDIRI4
ASGNI4
line 4015
;4015:  level.voteNo = 0;
ADDRGP4 level+176280
CNSTI4 0
ASGNI4
line 4016
;4016:  CheckVote();
ADDRGP4 CheckVote
CALLV
pop
line 4017
;4017:  level.teamVoteYes[0] = level.numConnectedClients;
ADDRGP4 level+180392
ADDRGP4 level+173940
INDIRI4
ASGNI4
line 4018
;4018:  level.teamVoteNo[0] = 0;
ADDRGP4 level+180400
CNSTI4 0
ASGNI4
line 4019
;4019:  CheckTeamVote(PTE_HUMANS);
CNSTI4 2
ARGI4
ADDRGP4 CheckTeamVote
CALLV
pop
line 4020
;4020:  level.teamVoteYes[1] = level.numConnectedClients;
ADDRGP4 level+180392+4
ADDRGP4 level+173940
INDIRI4
ASGNI4
line 4021
;4021:  level.teamVoteNo[1] = 0;
ADDRGP4 level+180400+4
CNSTI4 0
ASGNI4
line 4022
;4022:  CheckTeamVote(PTE_ALIENS);
CNSTI4 1
ARGI4
ADDRGP4 CheckTeamVote
CALLV
pop
line 4023
;4023:  AP(va("print \"^3!passvote: ^7%s^7 decided that everyone voted Yes\n\"",
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2475
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $2476
JUMPV
LABELV $2475
ADDRLP4 4
ADDRGP4 $342
ASGNP4
LABELV $2476
ADDRGP4 $2473
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4025
;4024:          (ent) ? G_admin_adminPrintName(ent) : "console"));
;4025:  return qtrue;
CNSTI4 1
RETI4
LABELV $2454
endproc G_admin_passvote 16 8
export G_admin_pause
proc G_admin_pause 12 12
line 4030
;4026:}
;4027:
;4028:qboolean
;4029:G_admin_pause(gentity_t *ent, int skiparg)
;4030:{
line 4031
;4031:  if (!level.paused)
ADDRGP4 level+189852
INDIRI4
CNSTI4 0
NEI4 $2478
line 4032
;4032:  {
line 4033
;4033:    AP(va("print \"^3!pause: ^7%s^7 paused the game.\n\"",
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2483
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRGP4 $2484
JUMPV
LABELV $2483
ADDRLP4 0
ADDRGP4 $342
ASGNP4
LABELV $2484
ADDRGP4 $2481
ARGP4
ADDRLP4 0
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
line 4035
;4034:            (ent) ? G_admin_adminPrintName(ent) : "console"));
;4035:    level.paused = qtrue;
ADDRGP4 level+189852
CNSTI4 1
ASGNI4
line 4036
;4036:    trap_SendServerCommand(-1, "cp \"The game has been paused. Please wait.\"");
CNSTI4 -1
ARGI4
ADDRGP4 $2486
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4037
;4037:  }
ADDRGP4 $2479
JUMPV
LABELV $2478
line 4039
;4038:  else
;4039:  {
line 4041
;4040:    // Prevent accidental pause->unpause race conditions by two admins doing !pause at once
;4041:    if (level.pausedTime < 1000)
ADDRGP4 level+189856
INDIRI4
CNSTI4 1000
GEI4 $2487
line 4042
;4042:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2477
JUMPV
LABELV $2487
line 4044
;4043:
;4044:    AP(va(
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2493
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRGP4 $2494
JUMPV
LABELV $2493
ADDRLP4 0
ADDRGP4 $342
ASGNP4
LABELV $2494
ADDRGP4 $2490
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 level+189856
INDIRI4
ARGI4
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
line 4047
;4045:            "print \"^3!pause: ^7%s^7 unpaused the game (Paused for %d msec) \n\"",
;4046:            (ent) ? G_admin_adminPrintName(ent) : "console", level.pausedTime));
;4047:    trap_SendServerCommand(-1, "cp \"The game has been unpaused!\"");
CNSTI4 -1
ARGI4
ADDRGP4 $2495
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4048
;4048:    level.paused = qfalse;
ADDRGP4 level+189852
CNSTI4 0
ASGNI4
line 4049
;4049:  }
LABELV $2479
line 4050
;4050:  return qtrue;
CNSTI4 1
RETI4
LABELV $2477
endproc G_admin_pause 12 12
export G_admin_spec999
proc G_admin_spec999 24 12
line 4055
;4051:}
;4052:
;4053:qboolean
;4054:G_admin_spec999(gentity_t *ent, int skiparg)
;4055:{
line 4059
;4056:  int i;
;4057:  gentity_t *vic;
;4058:
;4059:  for(i = 0;i < level.maxclients;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2501
JUMPV
LABELV $2498
line 4060
;4060:  {
line 4061
;4061:    vic = &g_entities[i];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4062
;4062:    if (!vic->client)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2503
line 4063
;4063:      continue;
ADDRGP4 $2499
JUMPV
LABELV $2503
line 4064
;4064:    if (vic->client->pers.connected != CON_CONNECTED)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $2505
line 4065
;4065:      continue;
ADDRGP4 $2499
JUMPV
LABELV $2505
line 4066
;4066:    if (vic->client->pers.teamSelection == PTE_NONE)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2507
line 4067
;4067:      continue;
ADDRGP4 $2499
JUMPV
LABELV $2507
line 4068
;4068:    if (vic->client->ps.ping == 999)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CNSTI4 999
NEI4 $2509
line 4069
;4069:    {
line 4070
;4070:      G_ChangeTeam(vic, PTE_NONE);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_ChangeTeam
CALLV
pop
line 4071
;4071:      AP(va("print \"^3!spec999: ^7%s^7 moved ^7%s^7 to spectators\n\"",
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2513
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
ADDRGP4 $2514
JUMPV
LABELV $2513
ADDRLP4 8
ADDRGP4 $342
ASGNP4
LABELV $2514
ADDRGP4 $2511
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
CNSTI4 516
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4074
;4072:              (ent) ? G_admin_adminPrintName(ent) : "console",
;4073:              vic->client->pers.netname));
;4074:    }
LABELV $2509
line 4075
;4075:  }
LABELV $2499
line 4059
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2501
ADDRLP4 4
INDIRI4
ADDRGP4 level+20
INDIRI4
LTI4 $2498
line 4076
;4076:  return qtrue;
CNSTI4 1
RETI4
LABELV $2497
endproc G_admin_spec999 24 12
export G_admin_register
proc G_admin_register 40 12
line 4081
;4077:}
;4078:
;4079:qboolean
;4080:G_admin_register(gentity_t *ent, int skiparg)
;4081:{
line 4082
;4082:  int level = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 4084
;4083:
;4084:  if (!ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2516
line 4085
;4085:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2515
JUMPV
LABELV $2516
line 4087
;4086:
;4087:  level = G_admin_level(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_admin_level
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 4089
;4088:
;4089:  if (level == 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2518
line 4090
;4090:    level = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $2518
line 4092
;4091:
;4092:  if (!Q_stricmp(ent->client->pers.guid, "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"))
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRGP4 $599
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $2520
line 4093
;4093:  {
line 4094
;4094:    ADMP(
ADDRGP4 $2522
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4097
;4095:        va(
;4096:            "^3!register: ^7 You cannot register for name protection until you update your client. Please replace your client executable with the one at http://trem.tjw.org/backport/ and reconnect. Updating your client will also allow you to have faster map downloads.\n"));
;4097:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2515
JUMPV
LABELV $2520
line 4100
;4098:  }
;4099:
;4100:  if (g_newbieNumbering.integer && g_newbieNamePrefix.string[0] && !Q_stricmpn(ent->client->pers.netname, g_newbieNamePrefix.string, strlen(
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 g_newbieNumbering+12
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $2523
ADDRGP4 g_newbieNamePrefix+16
INDIRI1
CVII4 1
ADDRLP4 12
INDIRI4
EQI4 $2523
ADDRGP4 g_newbieNamePrefix+16
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 20
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ARGP4
ADDRGP4 g_newbieNamePrefix+16
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $2523
line 4102
;4101:      g_newbieNamePrefix.string)))
;4102:  {
line 4103
;4103:    ADMP(va(
ADDRGP4 $2529
ARGP4
ADDRGP4 g_newbieNamePrefix+16
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4106
;4104:            "^3!register: ^7 You cannot register names that begin with '%s^7'.\n",
;4105:            g_newbieNamePrefix.string));
;4106:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2515
JUMPV
LABELV $2523
line 4109
;4107:  }
;4108:
;4109:  trap_SendConsoleCommand(EXEC_APPEND, va("!setlevel %d %d;", ent - g_entities, level));
ADDRGP4 $2531
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 4110
;4110:  ClientUserinfoChanged(ent - g_entities);
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 4112
;4111:
;4112:  AP(va("print \"^3!register: ^7%s^7 is now a protected nickname.\n\"",
ADDRGP4 $2532
ARGP4
ADDRLP4 32
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4115
;4113:          ent->client->pers.netname));
;4114:
;4115:  return qtrue;
CNSTI4 1
RETI4
LABELV $2515
endproc G_admin_register 40 12
export G_admin_rename
proc G_admin_rename 2452 16
line 4120
;4116:}
;4117:
;4118:qboolean
;4119:G_admin_rename(gentity_t *ent, int skiparg)
;4120:{
line 4128
;4121:  int pids[MAX_CLIENTS];
;4122:  char name[MAX_NAME_LENGTH];
;4123:  char newname[MAX_NAME_LENGTH];
;4124:  char oldname[MAX_NAME_LENGTH];
;4125:  char err[MAX_STRING_CHARS];
;4126:  char userinfo[MAX_INFO_STRING];
;4127:  char *s;
;4128:  gentity_t *victim = NULL;
ADDRLP4 2340
CNSTP4 0
ASGNP4
line 4130
;4129:
;4130:  if (G_SayArgc() < 3 + skiparg)
ADDRLP4 2408
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 2408
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
GEI4 $2534
line 4131
;4131:  {
line 4132
;4132:    ADMP("^3!rename: ^7usage: !rename [name] [newname]\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2536
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4133
;4133:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2533
JUMPV
LABELV $2534
line 4135
;4134:  }
;4135:  G_SayArgv(1 + skiparg, name, sizeof(name));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 2376
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 4136
;4136:  s = G_SayConcatArgs(2 + skiparg);
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 2412
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 2336
ADDRLP4 2412
INDIRP4
ASGNP4
line 4137
;4137:  Q_strncpyz(newname, s, sizeof(newname));
ADDRLP4 1280
ARGP4
ADDRLP4 2336
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4138
;4138:  if (G_ClientNumbersFromString(name, pids) != 1)
ADDRLP4 2376
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 2416
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 2416
INDIRI4
CNSTI4 1
EQI4 $2537
line 4139
;4139:  {
line 4140
;4140:    G_MatchOnePlayer(pids, err, sizeof(err));
ADDRLP4 0
ARGP4
ADDRLP4 1312
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLI4
pop
line 4141
;4141:    ADMP(va("^3!rename: ^7%s\n", err));
ADDRGP4 $2539
ARGP4
ADDRLP4 1312
ARGP4
ADDRLP4 2420
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2420
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4142
;4142:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2533
JUMPV
LABELV $2537
line 4144
;4143:  }
;4144:  victim = &g_entities[pids[0]];
ADDRLP4 2340
CNSTI4 2476
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4145
;4145:  if (!admin_higher(ent, victim))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2340
INDIRP4
ARGP4
ADDRLP4 2420
ADDRGP4 admin_higher
CALLI4
ASGNI4
ADDRLP4 2420
INDIRI4
CNSTI4 0
NEI4 $2540
line 4146
;4146:  {
line 4147
;4147:    ADMP("^3!rename: ^7sorry, but your intended victim has a higher admin"
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2542
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4149
;4148:        " level than you\n");
;4149:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2533
JUMPV
LABELV $2540
line 4151
;4150:  }
;4151:  if (!G_admin_name_check(victim, newname, err, sizeof(err)))
ADDRLP4 2340
INDIRP4
ARGP4
ADDRLP4 1280
ARGP4
ADDRLP4 1312
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2424
ADDRGP4 G_admin_name_check
CALLI4
ASGNI4
ADDRLP4 2424
INDIRI4
CNSTI4 0
NEI4 $2543
line 4152
;4152:  {
line 4153
;4153:    G_admin_print(ent, va("^3!rename: Invalid name: ^7%s\n", err));
ADDRGP4 $2545
ARGP4
ADDRLP4 1312
ARGP4
ADDRLP4 2428
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2428
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4154
;4154:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2533
JUMPV
LABELV $2543
line 4156
;4155:  }
;4156:  level.clients[pids[0]].pers.nameChanges--;
ADDRLP4 2428
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 648
ADDP4
ASGNP4
ADDRLP4 2428
INDIRP4
ADDRLP4 2428
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4157
;4157:  level.clients[pids[0]].pers.nameChangeTime = 0;
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 644
ADDP4
CNSTI4 0
ASGNI4
line 4158
;4158:  trap_GetUserinfo(pids[0], userinfo, sizeof(userinfo));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 4159
;4159:  s = Info_ValueForKey(userinfo, "name");
ADDRLP4 256
ARGP4
ADDRGP4 $785
ARGP4
ADDRLP4 2432
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 2336
ADDRLP4 2432
INDIRP4
ASGNP4
line 4160
;4160:  Q_strncpyz(oldname, s, sizeof(oldname));
ADDRLP4 2344
ARGP4
ADDRLP4 2336
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 4161
;4161:  Info_SetValueForKey(userinfo, "name", newname);
ADDRLP4 256
ARGP4
ADDRGP4 $785
ARGP4
ADDRLP4 1280
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 4162
;4162:  trap_SetUserinfo(pids[0], userinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 256
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 4163
;4163:  ClientUserinfoChanged(pids[0]);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 4164
;4164:  if (strcmp(oldname, level.clients[pids[0]].pers.netname))
ADDRLP4 2344
ARGP4
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2436
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2436
INDIRI4
CNSTI4 0
EQI4 $2546
line 4165
;4165:    AP(va(
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2550
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2444
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 2440
ADDRLP4 2444
INDIRP4
ASGNP4
ADDRGP4 $2551
JUMPV
LABELV $2550
ADDRLP4 2440
ADDRGP4 $342
ASGNP4
LABELV $2551
ADDRGP4 $2548
ARGP4
ADDRLP4 2344
ARGP4
CNSTI4 2148
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 516
ADDP4
ARGP4
ADDRLP4 2440
INDIRP4
ARGP4
ADDRLP4 2448
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2448
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $2546
line 4169
;4166:            "print \"^3!rename: ^7%s^7 has been renamed to %s^7 by %s\n\"", oldname,
;4167:            level.clients[pids[0]].pers.netname, (ent) ? G_admin_adminPrintName(ent)
;4168:            : "console"));
;4169:  return qtrue;
CNSTI4 1
RETI4
LABELV $2533
endproc G_admin_rename 2452 16
lit
align 1
LABELV $2553
byte 1 0
skip 255
align 1
LABELV $2554
byte 1 0
skip 255
export G_admin_restart
code
proc G_admin_restart 620 16
line 4174
;4170:}
;4171:
;4172:qboolean
;4173:G_admin_restart(gentity_t *ent, int skiparg)
;4174:{
line 4176
;4175:  char layout[MAX_CVAR_VALUE_STRING] =
;4176:  { "" };
ADDRLP4 264
ADDRGP4 $2553
INDIRB
ASGNB 256
line 4178
;4177:  char teampref[MAX_CVAR_VALUE_STRING] =
;4178:  { "" };
ADDRLP4 8
ADDRGP4 $2554
INDIRB
ASGNB 256
line 4182
;4179:  int i;
;4180:  gclient_t *cl;
;4181:
;4182:  if (G_SayArgc() > 1 + skiparg)
ADDRLP4 520
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 520
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
LEI4 $2555
line 4183
;4183:  {
line 4186
;4184:    char map[MAX_QPATH];
;4185:
;4186:    trap_Cvar_VariableStringBuffer("mapname", map, sizeof(map));
ADDRGP4 $1580
ARGP4
ADDRLP4 524
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 4187
;4187:    G_SayArgv(skiparg + 1, layout, sizeof(layout));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 264
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 4189
;4188:
;4189:    if (Q_stricmp(layout, "keepteams") && Q_stricmp(layout, "keepteamslock") && Q_stricmp(layout, "switchteams") && Q_stricmp(layout, "switchteamslock"))
ADDRLP4 264
ARGP4
ADDRGP4 $2559
ARGP4
ADDRLP4 588
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 588
INDIRI4
CNSTI4 0
EQI4 $2557
ADDRLP4 264
ARGP4
ADDRGP4 $2560
ARGP4
ADDRLP4 592
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 592
INDIRI4
CNSTI4 0
EQI4 $2557
ADDRLP4 264
ARGP4
ADDRGP4 $2561
ARGP4
ADDRLP4 596
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 596
INDIRI4
CNSTI4 0
EQI4 $2557
ADDRLP4 264
ARGP4
ADDRGP4 $2562
ARGP4
ADDRLP4 600
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 600
INDIRI4
CNSTI4 0
EQI4 $2557
line 4190
;4190:    {
line 4191
;4191:      if (!Q_stricmp(layout, "*BUILTIN*") || trap_FS_FOpenFile(va("layouts/%s/%s.dat", map, layout), NULL, FS_READ) > 0)
ADDRLP4 264
ARGP4
ADDRGP4 $1539
ARGP4
ADDRLP4 604
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 604
INDIRI4
CNSTI4 0
EQI4 $2565
ADDRGP4 $1540
ARGP4
ADDRLP4 524
ARGP4
ADDRLP4 264
ARGP4
ADDRLP4 608
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 608
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 612
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 612
INDIRI4
CNSTI4 0
LEI4 $2563
LABELV $2565
line 4192
;4192:      {
line 4193
;4193:        trap_Cvar_Set("g_layouts", layout);
ADDRGP4 $1542
ARGP4
ADDRLP4 264
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4194
;4194:      }
ADDRGP4 $2558
JUMPV
LABELV $2563
line 4196
;4195:      else
;4196:      {
line 4197
;4197:        ADMP(va("^3!restart: ^7layout '%s' does not exist\n", layout));
ADDRGP4 $2566
ARGP4
ADDRLP4 264
ARGP4
ADDRLP4 616
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 616
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4198
;4198:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2552
JUMPV
line 4200
;4199:      }
;4200:    }
LABELV $2557
line 4202
;4201:    else
;4202:    {
line 4203
;4203:      strcpy(layout, "");
ADDRLP4 264
ARGP4
ADDRGP4 $93
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 4204
;4204:      G_SayArgv(skiparg + 1, teampref, sizeof(teampref));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 4205
;4205:    }
LABELV $2558
line 4206
;4206:  }
LABELV $2555
line 4208
;4207:
;4208:  if (G_SayArgc() > 2 + skiparg)
ADDRLP4 524
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 524
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
LEI4 $2567
line 4209
;4209:  {
line 4210
;4210:    G_SayArgv(skiparg + 2, teampref, sizeof(teampref));
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 4211
;4211:  }
LABELV $2567
line 4213
;4212:
;4213:  if (!Q_stricmp(teampref, "keepteams") || !Q_stricmp(teampref, "keepteamslock"))
ADDRLP4 8
ARGP4
ADDRGP4 $2559
ARGP4
ADDRLP4 528
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 528
INDIRI4
CNSTI4 0
EQI4 $2571
ADDRLP4 8
ARGP4
ADDRGP4 $2560
ARGP4
ADDRLP4 532
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 532
INDIRI4
CNSTI4 0
NEI4 $2569
LABELV $2571
line 4214
;4214:  {
line 4215
;4215:    for(i = 0;i < g_maxclients.integer;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2575
JUMPV
LABELV $2572
line 4216
;4216:    {
line 4217
;4217:      cl = level.clients + i;
ADDRLP4 0
CNSTI4 2148
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 4218
;4218:      if (cl->pers.connected != CON_CONNECTED)
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $2577
line 4219
;4219:        continue;
ADDRGP4 $2573
JUMPV
LABELV $2577
line 4221
;4220:
;4221:      if (cl->pers.teamSelection == PTE_NONE)
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2579
line 4222
;4222:        continue;
ADDRGP4 $2573
JUMPV
LABELV $2579
line 4224
;4223:
;4224:      cl->sess.restartTeam = cl->pers.teamSelection;
ADDRLP4 0
INDIRP4
CNSTI4 1124
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ASGNI4
line 4225
;4225:    }
LABELV $2573
line 4215
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2575
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $2572
line 4226
;4226:  }
ADDRGP4 $2570
JUMPV
LABELV $2569
line 4227
;4227:  else if (!Q_stricmp(teampref, "switchteams") || !Q_stricmp(teampref, "switchteamslock"))
ADDRLP4 8
ARGP4
ADDRGP4 $2561
ARGP4
ADDRLP4 536
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 536
INDIRI4
CNSTI4 0
EQI4 $2583
ADDRLP4 8
ARGP4
ADDRGP4 $2562
ARGP4
ADDRLP4 540
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 540
INDIRI4
CNSTI4 0
NEI4 $2581
LABELV $2583
line 4228
;4228:  {
line 4229
;4229:    for(i = 0;i < g_maxclients.integer;i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2587
JUMPV
LABELV $2584
line 4230
;4230:    {
line 4231
;4231:      cl = level.clients + i;
ADDRLP4 0
CNSTI4 2148
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 4232
;4232:      if (cl->pers.connected != CON_CONNECTED)
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $2589
line 4233
;4233:        continue;
ADDRGP4 $2585
JUMPV
LABELV $2589
line 4235
;4234:
;4235:      if (cl->pers.teamSelection == PTE_NONE)
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2591
line 4236
;4236:        continue;
ADDRGP4 $2585
JUMPV
LABELV $2591
line 4238
;4237:
;4238:      if (cl->pers.teamSelection == PTE_ALIENS)
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2593
line 4239
;4239:        cl->sess.restartTeam = PTE_HUMANS;
ADDRLP4 0
INDIRP4
CNSTI4 1124
ADDP4
CNSTI4 2
ASGNI4
ADDRGP4 $2594
JUMPV
LABELV $2593
line 4240
;4240:      else if (cl->pers.teamSelection == PTE_HUMANS)
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 2
NEI4 $2595
line 4241
;4241:        cl->sess.restartTeam = PTE_ALIENS;
ADDRLP4 0
INDIRP4
CNSTI4 1124
ADDP4
CNSTI4 1
ASGNI4
LABELV $2595
LABELV $2594
line 4242
;4242:    }
LABELV $2585
line 4229
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2587
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $2584
line 4243
;4243:  }
LABELV $2581
LABELV $2570
line 4245
;4244:
;4245:  if (!Q_stricmp(teampref, "switchteamslock") || !Q_stricmp(teampref, "keepteamslock"))
ADDRLP4 8
ARGP4
ADDRGP4 $2562
ARGP4
ADDRLP4 544
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 544
INDIRI4
CNSTI4 0
EQI4 $2599
ADDRLP4 8
ARGP4
ADDRGP4 $2560
ARGP4
ADDRLP4 548
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 548
INDIRI4
CNSTI4 0
NEI4 $2597
LABELV $2599
line 4246
;4246:  {
line 4247
;4247:    trap_Cvar_Set("g_lockTeamsAtStart", "1");
ADDRGP4 $2600
ARGP4
ADDRGP4 $2601
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 4248
;4248:  }
LABELV $2597
line 4250
;4249:
;4250:  trap_SendConsoleCommand(EXEC_APPEND, "map_restart");
CNSTI4 2
ARGI4
ADDRGP4 $2602
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 4252
;4251:
;4252:  if (teampref[0])
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2603
line 4253
;4253:    strcpy(teampref, va("^7(with teams option: '%s^7')", teampref));
ADDRGP4 $2605
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 552
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 552
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $2603
line 4255
;4254:
;4255:  G_admin_maplog_result("R");
ADDRGP4 $2606
ARGP4
ADDRGP4 G_admin_maplog_result
CALLV
pop
line 4257
;4256:
;4257:  AP(va("print \"^3!restart: ^7map restarted by %s %s %s\n\"",
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2611
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 564
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 556
ADDRLP4 564
INDIRP4
ASGNP4
ADDRGP4 $2612
JUMPV
LABELV $2611
ADDRLP4 556
ADDRGP4 $342
ASGNP4
LABELV $2612
ADDRLP4 264
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2613
ADDRGP4 $2609
ARGP4
ADDRLP4 264
ARGP4
ADDRLP4 568
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 560
ADDRLP4 568
INDIRP4
ASGNP4
ADDRGP4 $2614
JUMPV
LABELV $2613
ADDRLP4 560
ADDRGP4 $93
ASGNP4
LABELV $2614
ADDRGP4 $2607
ARGP4
ADDRLP4 556
INDIRP4
ARGP4
ADDRLP4 560
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 572
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 572
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4260
;4258:          (ent) ? G_admin_adminPrintName(ent) : "console", (layout[0]) ? va(
;4259:              "^7(forcing layout '%s^7')", layout) : "", teampref));
;4260:  return qtrue;
CNSTI4 1
RETI4
LABELV $2552
endproc G_admin_restart 620 16
export G_admin_nextmap
proc G_admin_nextmap 24 8
line 4265
;4261:}
;4262:
;4263:qboolean
;4264:G_admin_nextmap(gentity_t *ent, int skiparg)
;4265:{
line 4266
;4266:  AP(va("print \"^3!nextmap: ^7%s^7 decided to load the next map\n\"",
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2618
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
ADDRGP4 $2619
JUMPV
LABELV $2618
ADDRLP4 0
ADDRGP4 $342
ASGNP4
LABELV $2619
ADDRGP4 $2616
ARGP4
ADDRLP4 0
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
line 4268
;4267:          (ent) ? G_admin_adminPrintName(ent) : "console"));
;4268:  level.lastWin = PTE_NONE;
ADDRGP4 level+189264
CNSTI4 0
ASGNI4
line 4269
;4269:  trap_SetConfigstring(CS_WINNER, "Evacuation");
CNSTI4 27
ARGI4
ADDRGP4 $2621
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 4270
;4270:  LogExit(va("nextmap was run by %s", (ent) ? G_admin_adminPrintName(ent) : "console"));
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2624
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
ADDRGP4 $2625
JUMPV
LABELV $2624
ADDRLP4 12
ADDRGP4 $342
ASGNP4
LABELV $2625
ADDRGP4 $2622
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 4271
;4271:  G_admin_maplog_result("N");
ADDRGP4 $2626
ARGP4
ADDRGP4 G_admin_maplog_result
CALLV
pop
line 4272
;4272:  return qtrue;
CNSTI4 1
RETI4
LABELV $2615
endproc G_admin_nextmap 24 8
lit
align 1
LABELV $2628
byte 1 0
skip 31
align 1
LABELV $2629
byte 1 0
skip 31
align 1
LABELV $2630
byte 1 0
skip 31
export G_admin_namelog
code
proc G_admin_namelog 152 16
line 4277
;4273:}
;4274:
;4275:qboolean
;4276:G_admin_namelog(gentity_t *ent, int skiparg)
;4277:{
line 4280
;4278:  int i, j;
;4279:  char search[MAX_NAME_LENGTH] =
;4280:  { "" };
ADDRLP4 88
ADDRGP4 $2628
INDIRB
ASGNB 32
line 4282
;4281:  char s2[MAX_NAME_LENGTH] =
;4282:  { "" };
ADDRLP4 49
ADDRGP4 $2629
INDIRB
ASGNB 32
line 4284
;4283:  char n2[MAX_NAME_LENGTH] =
;4284:  { "" };
ADDRLP4 8
ADDRGP4 $2630
INDIRB
ASGNB 32
line 4286
;4285:  char guid_stub[9];
;4286:  qboolean found = qfalse;
ADDRLP4 84
CNSTI4 0
ASGNI4
line 4287
;4287:  int printed = 0;
ADDRLP4 120
CNSTI4 0
ASGNI4
line 4289
;4288:
;4289:  if (G_SayArgc() > 1 + skiparg)
ADDRLP4 124
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
LEI4 $2631
line 4290
;4290:  {
line 4291
;4291:    G_SayArgv(1 + skiparg, search, sizeof(search));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 88
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 4292
;4292:    G_SanitiseString(search, s2, sizeof(s2));
ADDRLP4 88
ARGP4
ADDRLP4 49
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 4293
;4293:  }
LABELV $2631
line 4294
;4294:  ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 4295
;4295:  for(i = 0;i < MAX_ADMIN_NAMELOGS && g_admin_namelog[i];i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $2636
JUMPV
LABELV $2633
line 4296
;4296:  {
line 4297
;4297:    if (search[0])
ADDRLP4 88
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2637
line 4298
;4298:    {
line 4299
;4299:      found = qfalse;
ADDRLP4 84
CNSTI4 0
ASGNI4
line 4300
;4300:      for(j = 0;j < MAX_ADMIN_NAMELOG_NAMES && g_admin_namelog[i]->name[j][0];j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2642
JUMPV
LABELV $2639
line 4301
;4301:      {
line 4302
;4302:        G_SanitiseString(g_admin_namelog[i]->name[j], n2, sizeof(n2));
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 4303
;4303:        if (strstr(n2, s2))
ADDRLP4 8
ARGP4
ADDRLP4 49
ARGP4
ADDRLP4 128
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 128
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2643
line 4304
;4304:        {
line 4305
;4305:          found = qtrue;
ADDRLP4 84
CNSTI4 1
ASGNI4
line 4306
;4306:          break;
ADDRGP4 $2641
JUMPV
LABELV $2643
line 4308
;4307:        }
;4308:      }
LABELV $2640
line 4300
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2642
ADDRLP4 132
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 132
INDIRI4
GEI4 $2645
ADDRLP4 0
INDIRI4
ADDRLP4 132
INDIRI4
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2639
LABELV $2645
LABELV $2641
line 4309
;4309:      if (!found)
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $2646
line 4310
;4310:        continue;
ADDRGP4 $2634
JUMPV
LABELV $2646
line 4311
;4311:    }
LABELV $2637
line 4312
;4312:    printed++;
ADDRLP4 120
ADDRLP4 120
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4313
;4313:    for(j = 0;j < 8;j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2648
line 4314
;4314:      guid_stub[j] = g_admin_namelog[i]->guid[j + 24];
ADDRLP4 0
INDIRI4
ADDRLP4 40
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ADDP4
INDIRI1
ASGNI1
LABELV $2649
line 4313
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $2648
line 4315
;4315:    guid_stub[j] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 40
ADDP4
CNSTI1 0
ASGNI1
line 4316
;4316:    if (g_admin_namelog[i]->slot > -1)
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 -1
LEI4 $2652
line 4317
;4317:      ADMBP("^3");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1275
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
LABELV $2652
line 4318
;4318:    ADMBP(va("%-2s (*%s) %15s^7", (g_admin_namelog[i]->slot > -1) ? va("%d",
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
CNSTI4 -1
LEI4 $2656
ADDRGP4 $419
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
ADDRLP4 136
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 132
ADDRLP4 136
INDIRP4
ASGNP4
ADDRGP4 $2657
JUMPV
LABELV $2656
ADDRLP4 132
ADDRGP4 $1277
ASGNP4
LABELV $2657
ADDRGP4 $2654
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 160
ADDP4
ARGP4
ADDRLP4 140
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 4320
;4319:                g_admin_namelog[i]->slot) : "-", guid_stub, g_admin_namelog[i]->ip));
;4320:    for(j = 0;j < MAX_ADMIN_NAMELOG_NAMES && g_admin_namelog[i]->name[j][0];j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $2661
JUMPV
LABELV $2658
line 4321
;4321:    {
line 4322
;4322:      ADMBP(va(" '%s^7'", g_admin_namelog[i]->name[j]));
ADDRGP4 $2662
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
ARGP4
ADDRLP4 144
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 4323
;4323:    }
LABELV $2659
line 4320
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2661
ADDRLP4 148
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 148
INDIRI4
GEI4 $2663
ADDRLP4 0
INDIRI4
ADDRLP4 148
INDIRI4
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $2658
LABELV $2663
line 4324
;4324:    ADMBP("\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $417
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 4325
;4325:  }
LABELV $2634
line 4295
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2636
ADDRLP4 4
INDIRI4
CNSTI4 128
GEI4 $2664
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2633
LABELV $2664
line 4326
;4326:  ADMBP(va("^3!namelog:^7 %d recent clients found\n", printed));
ADDRGP4 $2665
ARGP4
ADDRLP4 120
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 4327
;4327:  ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 4328
;4328:  return qtrue;
CNSTI4 1
RETI4
LABELV $2627
endproc G_admin_namelog 152 16
lit
align 1
LABELV $2667
byte 1 0
skip 1
export G_admin_lock
code
proc G_admin_lock 36 12
line 4333
;4329:}
;4330:
;4331:qboolean
;4332:G_admin_lock(gentity_t *ent, int skiparg)
;4333:{
line 4335
;4334:  char teamName[2] =
;4335:  { "" };
ADDRLP4 0
ADDRGP4 $2667
INDIRB
ASGNB 2
line 4338
;4336:  pTeam_t team;
;4337:
;4338:  if (G_SayArgc() < 2 + skiparg)
ADDRLP4 8
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $2668
line 4339
;4339:  {
line 4340
;4340:    ADMP("^3!lock: ^7usage: !lock [a|h]\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2670
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4341
;4341:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2666
JUMPV
LABELV $2668
line 4343
;4342:  }
;4343:  G_SayArgv(1 + skiparg, teamName, sizeof(teamName));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 4344
;4344:  if (teamName[0] == 'a' || teamName[0] == 'A')
ADDRLP4 12
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 97
EQI4 $2673
ADDRLP4 12
INDIRI4
CNSTI4 65
NEI4 $2671
LABELV $2673
line 4345
;4345:    team = PTE_ALIENS;
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $2672
JUMPV
LABELV $2671
line 4346
;4346:  else if (teamName[0] == 'h' || teamName[0] == 'H')
ADDRLP4 16
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 104
EQI4 $2676
ADDRLP4 16
INDIRI4
CNSTI4 72
NEI4 $2674
LABELV $2676
line 4347
;4347:    team = PTE_HUMANS;
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRGP4 $2675
JUMPV
LABELV $2674
line 4349
;4348:  else
;4349:  {
line 4350
;4350:    ADMP(va("^3!lock: ^7invalid team\"%c\"\n", teamName[0]));
ADDRGP4 $2677
ARGP4
ADDRLP4 0
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4351
;4351:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2666
JUMPV
LABELV $2675
LABELV $2672
line 4354
;4352:  }
;4353:
;4354:  if (team == PTE_ALIENS)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $2678
line 4355
;4355:  {
line 4356
;4356:    if (level.alienTeamLocked)
ADDRGP4 level+189844
INDIRI4
CNSTI4 0
EQI4 $2680
line 4357
;4357:    {
line 4358
;4358:      ADMP("^3!lock: ^7Alien team is already locked\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2683
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4359
;4359:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2666
JUMPV
LABELV $2680
line 4362
;4360:    }
;4361:    else
;4362:      level.alienTeamLocked = qtrue;
ADDRGP4 level+189844
CNSTI4 1
ASGNI4
line 4363
;4363:  }
ADDRGP4 $2679
JUMPV
LABELV $2678
line 4364
;4364:  else if (team == PTE_HUMANS)
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $2685
line 4365
;4365:  {
line 4366
;4366:    if (level.humanTeamLocked)
ADDRGP4 level+189848
INDIRI4
CNSTI4 0
EQI4 $2687
line 4367
;4367:    {
line 4368
;4368:      ADMP("^3!lock: ^7Human team is already locked\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2690
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4369
;4369:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2666
JUMPV
LABELV $2687
line 4372
;4370:    }
;4371:    else
;4372:      level.humanTeamLocked = qtrue;
ADDRGP4 level+189848
CNSTI4 1
ASGNI4
line 4373
;4373:  }
LABELV $2685
LABELV $2679
line 4375
;4374:
;4375:  AP(va("print \"^3!lock: ^7%s team has been locked by %s\n\"", (team
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2697
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 28
INDIRP4
ASGNP4
ADDRGP4 $2698
JUMPV
LABELV $2697
ADDRLP4 20
ADDRGP4 $342
ASGNP4
LABELV $2698
ADDRGP4 $2692
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $2699
ADDRLP4 24
ADDRGP4 $2693
ASGNP4
ADDRGP4 $2700
JUMPV
LABELV $2699
ADDRLP4 24
ADDRGP4 $2694
ASGNP4
LABELV $2700
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4378
;4376:              == PTE_ALIENS) ? "Alien" : "Human", (ent) ? G_admin_adminPrintName(ent)
;4377:          : "console"));
;4378:  return qtrue;
CNSTI4 1
RETI4
LABELV $2666
endproc G_admin_lock 36 12
lit
align 1
LABELV $2702
byte 1 0
skip 1
export G_admin_unlock
code
proc G_admin_unlock 36 12
line 4383
;4379:}
;4380:
;4381:qboolean
;4382:G_admin_unlock(gentity_t *ent, int skiparg)
;4383:{
line 4385
;4384:  char teamName[2] =
;4385:  { "" };
ADDRLP4 0
ADDRGP4 $2702
INDIRB
ASGNB 2
line 4388
;4386:  pTeam_t team;
;4387:
;4388:  if (G_SayArgc() < 2 + skiparg)
ADDRLP4 8
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $2703
line 4389
;4389:  {
line 4390
;4390:    ADMP("^3!unlock: ^7usage: !unlock [a|h]\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2705
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4391
;4391:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2701
JUMPV
LABELV $2703
line 4393
;4392:  }
;4393:  G_SayArgv(1 + skiparg, teamName, sizeof(teamName));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 4394
;4394:  if (teamName[0] == 'a' || teamName[0] == 'A')
ADDRLP4 12
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 97
EQI4 $2708
ADDRLP4 12
INDIRI4
CNSTI4 65
NEI4 $2706
LABELV $2708
line 4395
;4395:    team = PTE_ALIENS;
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $2707
JUMPV
LABELV $2706
line 4396
;4396:  else if (teamName[0] == 'h' || teamName[0] == 'H')
ADDRLP4 16
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 104
EQI4 $2711
ADDRLP4 16
INDIRI4
CNSTI4 72
NEI4 $2709
LABELV $2711
line 4397
;4397:    team = PTE_HUMANS;
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRGP4 $2710
JUMPV
LABELV $2709
line 4399
;4398:  else
;4399:  {
line 4400
;4400:    ADMP(va("^3!unlock: ^7invalid team\"%c\"\n", teamName[0]));
ADDRGP4 $2712
ARGP4
ADDRLP4 0
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4401
;4401:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2701
JUMPV
LABELV $2710
LABELV $2707
line 4404
;4402:  }
;4403:
;4404:  if (team == PTE_ALIENS)
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $2713
line 4405
;4405:  {
line 4406
;4406:    if (!level.alienTeamLocked)
ADDRGP4 level+189844
INDIRI4
CNSTI4 0
NEI4 $2715
line 4407
;4407:    {
line 4408
;4408:      ADMP("^3!unlock: ^7Alien team is not currently locked\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2718
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4409
;4409:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2701
JUMPV
LABELV $2715
line 4412
;4410:    }
;4411:    else
;4412:      level.alienTeamLocked = qfalse;
ADDRGP4 level+189844
CNSTI4 0
ASGNI4
line 4413
;4413:  }
ADDRGP4 $2714
JUMPV
LABELV $2713
line 4414
;4414:  else if (team == PTE_HUMANS)
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $2720
line 4415
;4415:  {
line 4416
;4416:    if (!level.humanTeamLocked)
ADDRGP4 level+189848
INDIRI4
CNSTI4 0
NEI4 $2722
line 4417
;4417:    {
line 4418
;4418:      ADMP("^3!unlock: ^7Human team is not currently locked\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2725
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4419
;4419:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2701
JUMPV
LABELV $2722
line 4422
;4420:    }
;4421:    else
;4422:      level.humanTeamLocked = qfalse;
ADDRGP4 level+189848
CNSTI4 0
ASGNI4
line 4423
;4423:  }
LABELV $2720
LABELV $2714
line 4425
;4424:
;4425:  AP(va("print \"^3!unlock: ^7%s team has been unlocked by %s\n\"", (team
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2730
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 28
INDIRP4
ASGNP4
ADDRGP4 $2731
JUMPV
LABELV $2730
ADDRLP4 20
ADDRGP4 $342
ASGNP4
LABELV $2731
ADDRGP4 $2727
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $2732
ADDRLP4 24
ADDRGP4 $2693
ASGNP4
ADDRGP4 $2733
JUMPV
LABELV $2732
ADDRLP4 24
ADDRGP4 $2694
ASGNP4
LABELV $2733
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4428
;4426:              == PTE_ALIENS) ? "Alien" : "Human", (ent) ? G_admin_adminPrintName(ent)
;4427:          : "console"));
;4428:  return qtrue;
CNSTI4 1
RETI4
LABELV $2701
endproc G_admin_unlock 36 12
export G_admin_designate
proc G_admin_designate 1380 12
line 4433
;4429:}
;4430:
;4431:qboolean
;4432:G_admin_designate(gentity_t *ent, int skiparg)
;4433:{
line 4439
;4434:  int pids[MAX_CLIENTS];
;4435:  char name[MAX_NAME_LENGTH], err[MAX_STRING_CHARS];
;4436:  char command[MAX_ADMIN_CMD_LEN], *cmd;
;4437:  gentity_t *vic;
;4438:
;4439:  if (G_SayArgc() < 2 + skiparg)
ADDRLP4 1340
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 1340
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $2735
line 4440
;4440:  {
line 4441
;4441:    ADMP("^3!designate: ^7usage: designate [name|slot#]\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2737
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4442
;4442:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2734
JUMPV
LABELV $2735
line 4444
;4443:  }
;4444:  G_SayArgv(skiparg, command, sizeof(command));
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 296
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 4445
;4445:  cmd = command;
ADDRLP4 256
ADDRLP4 296
ASGNP4
line 4446
;4446:  if (cmd && *cmd == '!')
ADDRLP4 256
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2738
ADDRLP4 256
INDIRP4
INDIRI1
CVII4 1
CNSTI4 33
NEI4 $2738
line 4447
;4447:    cmd++;
ADDRLP4 256
ADDRLP4 256
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $2738
line 4448
;4448:  G_SayArgv(1 + skiparg, name, sizeof(name));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 264
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 4449
;4449:  if (G_ClientNumbersFromString(name, pids) != 1)
ADDRLP4 264
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1348
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 1348
INDIRI4
CNSTI4 1
EQI4 $2740
line 4450
;4450:  {
line 4451
;4451:    G_MatchOnePlayer(pids, err, sizeof(err));
ADDRLP4 0
ARGP4
ADDRLP4 316
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLI4
pop
line 4452
;4452:    ADMP(va("^3!designate: ^7%s\n", err));
ADDRGP4 $2742
ARGP4
ADDRLP4 316
ARGP4
ADDRLP4 1352
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1352
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4453
;4453:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2734
JUMPV
LABELV $2740
line 4455
;4454:  }
;4455:  if (!admin_higher(ent, &g_entities[pids[0]]) && !Q_stricmp(cmd, "undesignate"))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2476
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1352
ADDRGP4 admin_higher
CALLI4
ASGNI4
ADDRLP4 1352
INDIRI4
CNSTI4 0
NEI4 $2743
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 $220
ARGP4
ADDRLP4 1356
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1356
INDIRI4
CNSTI4 0
NEI4 $2743
line 4456
;4456:  {
line 4457
;4457:    ADMP("^3!mute: ^7sorry, but your intended victim has a higher admin"
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2745
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4459
;4458:        " level than you\n");
;4459:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2734
JUMPV
LABELV $2743
line 4461
;4460:  }
;4461:  vic = &g_entities[pids[0]];
ADDRLP4 260
CNSTI4 2476
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4462
;4462:  if (vic->client->pers.designatedBuilder == qtrue)
ADDRLP4 260
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2746
line 4463
;4463:  {
line 4464
;4464:    if (!Q_stricmp(cmd, "designate"))
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 $127
ARGP4
ADDRLP4 1360
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1360
INDIRI4
CNSTI4 0
NEI4 $2748
line 4465
;4465:    {
line 4466
;4466:      ADMP("^3!designate: ^7player is already designated builder\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2750
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4467
;4467:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2734
JUMPV
LABELV $2748
line 4469
;4468:    }
;4469:    vic->client->pers.designatedBuilder = qfalse;
ADDRLP4 260
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
CNSTI4 0
ASGNI4
line 4470
;4470:    CPx(pids[0], "cp \"^1Your designation has been revoked\"");
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2751
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4471
;4471:    AP(
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2754
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1368
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 1364
ADDRLP4 1368
INDIRP4
ASGNP4
ADDRGP4 $2755
JUMPV
LABELV $2754
ADDRLP4 1364
ADDRGP4 $342
ASGNP4
LABELV $2755
ADDRGP4 $2752
ARGP4
ADDRLP4 1372
CNSTI4 516
ASGNI4
ADDRLP4 260
INDIRP4
ADDRLP4 1372
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1372
INDIRI4
ADDP4
ARGP4
ADDRLP4 1364
INDIRP4
ARGP4
ADDRLP4 1376
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1376
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4476
;4472:        va(
;4473:            "print \"^3!designate: ^7%s^7's designation has been revoked by %s\n\"",
;4474:            vic->client->pers.netname, (ent) ? G_admin_adminPrintName(ent)
;4475:            : "console"));
;4476:    G_CheckDBProtection();
ADDRGP4 G_CheckDBProtection
CALLV
pop
line 4477
;4477:  }
ADDRGP4 $2747
JUMPV
LABELV $2746
line 4479
;4478:  else
;4479:  {
line 4480
;4480:    if (!Q_stricmp(cmd, "undesignate"))
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 $220
ARGP4
ADDRLP4 1360
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1360
INDIRI4
CNSTI4 0
NEI4 $2756
line 4481
;4481:    {
line 4482
;4482:      ADMP("^3!undesignate: ^7player is not currently designated builder\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2758
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4483
;4483:      return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2734
JUMPV
LABELV $2756
line 4485
;4484:    }
;4485:    vic->client->pers.designatedBuilder = qtrue;
ADDRLP4 260
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1040
ADDP4
CNSTI4 1
ASGNI4
line 4486
;4486:    CPx(pids[0], "cp \"^1You've been designated\"");
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $2759
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4487
;4487:    AP(va("print \"^3!designate: ^7%s^7 has been designated by ^7%s\n\"",
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2762
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1368
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 1364
ADDRLP4 1368
INDIRP4
ASGNP4
ADDRGP4 $2763
JUMPV
LABELV $2762
ADDRLP4 1364
ADDRGP4 $342
ASGNP4
LABELV $2763
ADDRGP4 $2760
ARGP4
ADDRLP4 1372
CNSTI4 516
ASGNI4
ADDRLP4 260
INDIRP4
ADDRLP4 1372
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1372
INDIRI4
ADDP4
ARGP4
ADDRLP4 1364
INDIRP4
ARGP4
ADDRLP4 1376
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1376
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4490
;4488:            vic->client->pers.netname, (ent) ? G_admin_adminPrintName(ent)
;4489:            : "console"));
;4490:  }
LABELV $2747
line 4491
;4491:  ClientUserinfoChanged(pids[0]);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 4492
;4492:  return qtrue;
CNSTI4 1
RETI4
LABELV $2734
endproc G_admin_designate 1380 12
export G_admin_warn
proc G_admin_warn 1376 16
line 4499
;4493:}
;4494:
;4495://!Warn by Gate (Daniel Evans)
;4496:
;4497:qboolean
;4498:G_admin_warn(gentity_t *ent, int skiparg)
;4499:{//mostly copy and paste with the proper lines altered from !mute and !kick
line 4505
;4500:  int pids[MAX_CLIENTS];
;4501:  char name[MAX_NAME_LENGTH], *reason, err[MAX_STRING_CHARS];
;4502:  int minargc;
;4503:  gentity_t *vic;
;4504:
;4505:  minargc = 3 + skiparg;
ADDRLP4 292
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 4506
;4506:  if (G_admin_permission(ent, ADMF_UNACCOUNTABLE))
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1158
ARGP4
ADDRLP4 1324
ADDRGP4 G_admin_permission
CALLI4
ASGNI4
ADDRLP4 1324
INDIRI4
CNSTI4 0
EQI4 $2765
line 4507
;4507:    minargc = 2 + skiparg;
ADDRLP4 292
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
LABELV $2765
line 4509
;4508:
;4509:  if (G_SayArgc() < minargc)
ADDRLP4 1328
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 1328
INDIRI4
ADDRLP4 292
INDIRI4
GEI4 $2767
line 4510
;4510:  {
line 4511
;4511:    ADMP("^3!warn: ^7usage: warn [name] [reason]\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2769
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4512
;4512:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2764
JUMPV
LABELV $2767
line 4514
;4513:  }
;4514:  G_SayArgv(1 + skiparg, name, sizeof(name));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 4515
;4515:  reason = G_SayConcatArgs(2 + skiparg);
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 1332
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1332
INDIRP4
ASGNP4
line 4516
;4516:  if (G_ClientNumbersFromString(name, pids) != 1)
ADDRLP4 260
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1336
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 1336
INDIRI4
CNSTI4 1
EQI4 $2770
line 4517
;4517:  {
line 4518
;4518:    G_MatchOnePlayer(pids, err, sizeof(err));
ADDRLP4 4
ARGP4
ADDRLP4 300
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLI4
pop
line 4519
;4519:    ADMP(va("^3!warn: ^7%s\n", err));
ADDRGP4 $2772
ARGP4
ADDRLP4 300
ARGP4
ADDRLP4 1340
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1340
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4520
;4520:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2764
JUMPV
LABELV $2770
line 4522
;4521:  }
;4522:  if (!admin_higher(ent, &g_entities[pids[0]]))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1340
ADDRGP4 admin_higher
CALLI4
ASGNI4
ADDRLP4 1340
INDIRI4
CNSTI4 0
NEI4 $2773
line 4523
;4523:  {
line 4524
;4524:    ADMP("^3!warn: ^7sorry, but your intended victim has a higher admin"
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2775
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4526
;4525:        " level than you.\n");
;4526:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2764
JUMPV
LABELV $2773
line 4529
;4527:  }
;4528:
;4529:  vic = &g_entities[pids[0]];
ADDRLP4 296
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4531
;4530:  //next line is the onscreen warning
;4531:  CPx(
ADDRGP4 $2776
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2780
ADDRLP4 1344
ADDRGP4 $2777
ASGNP4
ADDRGP4 $2781
JUMPV
LABELV $2780
ADDRLP4 1344
ADDRGP4 $93
ASGNP4
LABELV $2781
ADDRLP4 1344
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2782
ADDRLP4 1348
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $2783
JUMPV
LABELV $2782
ADDRLP4 1348
ADDRGP4 $93
ASGNP4
LABELV $2783
ADDRLP4 1348
INDIRP4
ARGP4
ADDRLP4 1352
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1352
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4536
;4532:      pids[0],
;4533:      va(
;4534:          "cp \"^1You have been warned by an administrator.\n ^3Cease immediately or face admin action!\n^1 %s%s\"",
;4535:          (*reason) ? "REASON: " : "", (*reason) ? reason : ""));
;4536:  AP(
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2788
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1364
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 1356
ADDRLP4 1364
INDIRP4
ASGNP4
ADDRGP4 $2789
JUMPV
LABELV $2788
ADDRLP4 1356
ADDRGP4 $342
ASGNP4
LABELV $2789
ADDRGP4 $2784
ARGP4
ADDRLP4 1368
CNSTI4 516
ASGNI4
ADDRLP4 296
INDIRP4
ADDRLP4 1368
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1368
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2790
ADDRLP4 1360
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $2791
JUMPV
LABELV $2790
ADDRLP4 1360
ADDRGP4 $2785
ASGNP4
LABELV $2791
ADDRLP4 1360
INDIRP4
ARGP4
ADDRLP4 1356
INDIRP4
ARGP4
ADDRLP4 1372
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1372
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4542
;4537:      va(
;4538:          "print \"^3!warn: ^7%s^7 has been warned to cease and desist: %s by %s \n\"",
;4539:          vic->client->pers.netname, (*reason) ? reason
;4540:          : "his current activity", (ent) ? G_admin_adminPrintName(ent)
;4541:          : "console")); //console announcement
;4542:  return qtrue;
CNSTI4 1
RETI4
LABELV $2764
endproc G_admin_warn 1376 16
export G_admin_putmespec
proc G_admin_putmespec 28 8
line 4547
;4543:}
;4544:
;4545:qboolean
;4546:G_admin_putmespec(gentity_t *ent, int skiparg)
;4547:{
line 4548
;4548:  if (!ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2793
line 4549
;4549:  {
line 4550
;4550:    ADMP("!specme: sorry, but console isn't allowed on the spectators team\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2795
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4551
;4551:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2792
JUMPV
LABELV $2793
line 4554
;4552:  }
;4553:
;4554:  if (ent->client->pers.teamSelection == PTE_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2796
line 4555
;4555:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2792
JUMPV
LABELV $2796
line 4558
;4556:
;4557:  //guard against build timer exploit
;4558:  if (ent->client->pers.teamSelection != PTE_NONE && ent->client->sess.sessionTeam != TEAM_SPECTATOR && (ent->client->ps.stats[STAT_PCLASS]
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2798
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1120
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2798
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $2802
ADDRLP4 8
INDIRI4
CNSTI4 2
EQI4 $2802
CNSTI4 21
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 BG_InventoryContainsWeapon
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $2802
CNSTI4 20
ARGI4
ADDRFP4 0
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
EQI4 $2798
LABELV $2802
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2798
line 4561
;4559:      == PCL_ALIEN_BUILDER0 || ent->client->ps.stats[STAT_PCLASS] == PCL_ALIEN_BUILDER0_UPG || BG_InventoryContainsWeapon(WP_HBUILD, ent->client->ps.stats)
;4560:      || BG_InventoryContainsWeapon(WP_HBUILD2, ent->client->ps.stats)) && ent->client->ps.stats[STAT_MISC] > 0)
;4561:  {
line 4562
;4562:    ADMP("!specme: You cannot leave your team until the build timer expires");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2803
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4563
;4563:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2792
JUMPV
LABELV $2798
line 4566
;4564:  }
;4565:
;4566:  G_ChangeTeam(ent, PTE_NONE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_ChangeTeam
CALLV
pop
line 4567
;4567:  AP(va("print \"^3!specme: ^7%s^7 decided to join the spectators\n\"",
ADDRGP4 $2804
ARGP4
ADDRLP4 20
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4569
;4568:          ent->client->pers.netname));
;4569:  return qtrue;
CNSTI4 1
RETI4
LABELV $2792
endproc G_admin_putmespec 28 8
export G_admin_buildlog
proc G_admin_buildlog 3500 48
line 4574
;4570:}
;4571:
;4572:qboolean
;4573:G_admin_buildlog(gentity_t *ent, int skiparg)
;4574:{
line 4577
;4575:#define LOG_DISPLAY_LENGTH 10
;4576:  buildHistory_t *ptr;
;4577:  gentity_t *builder = NULL;
ADDRLP4 1040
CNSTP4 0
ASGNP4
line 4578
;4578:  int skip = 0, start = 0, lastID = -1, firstID = -1, i, len, matchlen = 0;
ADDRLP4 1044
CNSTI4 0
ASGNI4
ADDRLP4 2100
CNSTI4 0
ASGNI4
ADDRLP4 2084
CNSTI4 -1
ASGNI4
ADDRLP4 2096
CNSTI4 -1
ASGNI4
ADDRLP4 1048
CNSTI4 0
ASGNI4
line 4579
;4579:  pTeam_t team = PTE_NONE;
ADDRLP4 1036
CNSTI4 0
ASGNI4
line 4582
;4580:  char message[MAX_STRING_CHARS], *teamchar;
;4581:  char *name, *action, *buildablename, markstring[MAX_STRING_CHARS];
;4582:  if (!g_buildLogMaxLength.integer)
ADDRGP4 g_buildLogMaxLength+12
INDIRI4
CNSTI4 0
NEI4 $2806
line 4583
;4583:  {
line 4584
;4584:    ADMP("^3!buildlog: ^7build logging is disabled");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2809
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4585
;4585:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2805
JUMPV
LABELV $2806
line 4587
;4586:  }
;4587:  if (G_SayArgc() >= 2 + skiparg)
ADDRLP4 2104
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
LTI4 $2810
line 4588
;4588:  {
line 4589
;4589:    for(i = 1;i + skiparg < G_SayArgc();i++)
ADDRLP4 1032
CNSTI4 1
ASGNI4
ADDRGP4 $2815
JUMPV
LABELV $2812
line 4590
;4590:    {
line 4592
;4591:      char argbuf[64], err[MAX_STRING_CHARS];
;4592:      int x = 0, pids[MAX_CLIENTS];
ADDRLP4 2172
CNSTI4 0
ASGNI4
line 4593
;4593:      G_SayArgv(i + skiparg, argbuf, sizeof argbuf);
ADDRLP4 1032
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ARGI4
ADDRLP4 2108
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 4594
;4594:      switch(argbuf[0])
ADDRLP4 3456
ADDRLP4 2108
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 3464
CNSTI4 72
ASGNI4
ADDRLP4 3456
INDIRI4
ADDRLP4 3464
INDIRI4
EQI4 $2828
ADDRLP4 3456
INDIRI4
ADDRLP4 3464
INDIRI4
GTI4 $2830
LABELV $2829
ADDRLP4 3472
CNSTI4 45
ASGNI4
ADDRLP4 3456
INDIRI4
ADDRLP4 3472
INDIRI4
EQI4 $2822
ADDRLP4 3456
INDIRI4
ADDRLP4 3472
INDIRI4
GTI4 $2832
LABELV $2831
ADDRLP4 3456
INDIRI4
CNSTI4 35
EQI4 $2820
ADDRGP4 $2816
JUMPV
LABELV $2832
ADDRLP4 3456
INDIRI4
CNSTI4 65
EQI4 $2827
ADDRGP4 $2816
JUMPV
LABELV $2830
ADDRLP4 3480
CNSTI4 104
ASGNI4
ADDRLP4 3456
INDIRI4
ADDRLP4 3480
INDIRI4
EQI4 $2828
ADDRLP4 3456
INDIRI4
ADDRLP4 3480
INDIRI4
GTI4 $2834
LABELV $2833
ADDRLP4 3456
INDIRI4
CNSTI4 97
EQI4 $2827
ADDRGP4 $2816
JUMPV
LABELV $2834
ADDRLP4 3456
INDIRI4
CNSTI4 120
EQI4 $2819
ADDRGP4 $2816
JUMPV
line 4595
;4595:      {
LABELV $2819
line 4597
;4596:        case 'x':
;4597:          x = 1;
ADDRLP4 2172
CNSTI4 1
ASGNI4
LABELV $2816
line 4599
;4598:        default:
;4599:          skip = atoi(argbuf + x);
ADDRLP4 2172
INDIRI4
ADDRLP4 2108
ADDP4
ARGP4
ADDRLP4 3484
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 3484
INDIRI4
ASGNI4
line 4600
;4600:          start = 0;
ADDRLP4 2100
CNSTI4 0
ASGNI4
line 4601
;4601:          break;
ADDRGP4 $2817
JUMPV
LABELV $2820
line 4603
;4602:        case '#':
;4603:          start = atoi(argbuf + 1);
ADDRLP4 2108+1
ARGP4
ADDRLP4 3488
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2100
ADDRLP4 3488
INDIRI4
ASGNI4
line 4604
;4604:          skip = 0;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 4605
;4605:          break;
ADDRGP4 $2817
JUMPV
LABELV $2822
line 4607
;4606:        case '-':
;4607:          if (G_ClientNumbersFromString(argbuf + 1, pids) != 1)
ADDRLP4 2108+1
ARGP4
ADDRLP4 2176
ARGP4
ADDRLP4 3492
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 3492
INDIRI4
CNSTI4 1
EQI4 $2823
line 4608
;4608:          {
line 4609
;4609:            G_MatchOnePlayer(pids, err, sizeof(err));
ADDRLP4 2176
ARGP4
ADDRLP4 2432
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLI4
pop
line 4610
;4610:            ADMP(va("^3!revert: ^7%s\n", err));
ADDRGP4 $2826
ARGP4
ADDRLP4 2432
ARGP4
ADDRLP4 3496
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 3496
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4611
;4611:            return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2805
JUMPV
LABELV $2823
line 4613
;4612:          }
;4613:          builder = g_entities + *pids;
ADDRLP4 1040
CNSTI4 2476
ADDRLP4 2176
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4614
;4614:          break;
ADDRGP4 $2817
JUMPV
LABELV $2827
line 4617
;4615:        case 'A':
;4616:        case 'a':
;4617:          team = PTE_ALIENS;
ADDRLP4 1036
CNSTI4 1
ASGNI4
line 4618
;4618:          break;
ADDRGP4 $2817
JUMPV
LABELV $2828
line 4621
;4619:        case 'H':
;4620:        case 'h':
;4621:          team = PTE_HUMANS;
ADDRLP4 1036
CNSTI4 2
ASGNI4
line 4622
;4622:          break;
LABELV $2817
line 4624
;4623:      }
;4624:    }
LABELV $2813
line 4589
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2815
ADDRLP4 2108
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ADDRLP4 2108
INDIRI4
LTI4 $2812
line 4625
;4625:  }
LABELV $2810
line 4627
;4626:  // !buildlog can be abused, so let everyone know when it is used
;4627:  AP(va("print \"^3!buildlog: ^7%s^7 requested a log of recent building"
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2837
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2112
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 2108
ADDRLP4 2112
INDIRP4
ASGNP4
ADDRGP4 $2838
JUMPV
LABELV $2837
ADDRLP4 2108
ADDRGP4 $342
ASGNP4
LABELV $2838
ADDRGP4 $2835
ARGP4
ADDRLP4 2108
INDIRP4
ARGP4
ADDRLP4 2116
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2116
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4629
;4628:          " activity\n\"", (ent) ? G_admin_adminPrintName(ent) : "console"));
;4629:  len = G_CountBuildLog(); // also clips the log if too long
ADDRLP4 2120
ADDRGP4 G_CountBuildLog
CALLI4
ASGNI4
ADDRLP4 1052
ADDRLP4 2120
INDIRI4
ASGNI4
line 4630
;4630:  if (!len)
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $2839
line 4631
;4631:  {
line 4632
;4632:    ADMP("^3!buildlog: ^7no build log found\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2841
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4633
;4633:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2805
JUMPV
LABELV $2839
line 4635
;4634:  }
;4635:  if (start)
ADDRLP4 2100
INDIRI4
CNSTI4 0
EQI4 $2842
line 4636
;4636:  {
line 4638
;4637:    // set skip based on start
;4638:    for(ptr = level.buildHistory;ptr && ptr->ID != start;ptr = ptr->next, skip++)
ADDRLP4 0
ADDRGP4 level+189972
INDIRP4
ASGNP4
ADDRGP4 $2847
JUMPV
LABELV $2844
line 4639
;4639:      ;
LABELV $2845
line 4638
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2847
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2849
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 2100
INDIRI4
NEI4 $2844
LABELV $2849
line 4640
;4640:    if (!ptr)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2850
line 4641
;4641:    {
line 4642
;4642:      ADMP("^3!buildlog: ^7log ID not found\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2852
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4643
;4643:      skip = 0;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 4644
;4644:    }
LABELV $2850
line 4645
;4645:  }
LABELV $2842
line 4647
;4646:  // ensure skip is a useful value
;4647:  if (skip > len - LOG_DISPLAY_LENGTH)
ADDRLP4 1044
INDIRI4
ADDRLP4 1052
INDIRI4
CNSTI4 10
SUBI4
LEI4 $2853
line 4648
;4648:    skip = len - LOG_DISPLAY_LENGTH;
ADDRLP4 1044
ADDRLP4 1052
INDIRI4
CNSTI4 10
SUBI4
ASGNI4
LABELV $2853
line 4649
;4649:  *message = '\0';
ADDRLP4 1056
CNSTI1 0
ASGNI1
line 4651
;4650:  // skip to start entry
;4651:  for(ptr = level.buildHistory, i = len;ptr && i > len - skip;ptr = ptr->next)
ADDRLP4 0
ADDRGP4 level+189972
INDIRP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1052
INDIRI4
ASGNI4
ADDRGP4 $2858
JUMPV
LABELV $2855
line 4652
;4652:  {
line 4655
;4653:    // these checks could perhaps be done more efficiently but they are cheap
;4654:    // in processor time so I'm not worrying
;4655:    if (team != PTE_NONE && team != BG_FindTeamForBuildable(ptr->buildable))
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $2860
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 2128
ADDRGP4 BG_FindTeamForBuildable
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
ADDRLP4 2128
INDIRI4
EQI4 $2860
line 4656
;4656:      continue;
ADDRGP4 $2856
JUMPV
LABELV $2860
line 4657
;4657:    if (builder && builder != ptr->ent)
ADDRLP4 2132
ADDRLP4 1040
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 2132
INDIRU4
CNSTU4 0
EQU4 $2862
ADDRLP4 2132
INDIRU4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
EQU4 $2862
line 4658
;4658:      continue;
ADDRGP4 $2856
JUMPV
LABELV $2862
line 4659
;4659:    matchlen++;
ADDRLP4 1048
ADDRLP4 1048
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4660
;4660:    i--;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4661
;4661:  }
LABELV $2856
line 4651
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
LABELV $2858
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2864
ADDRLP4 1032
INDIRI4
ADDRLP4 1052
INDIRI4
ADDRLP4 1044
INDIRI4
SUBI4
GTI4 $2855
LABELV $2864
line 4662
;4662:  for(;i + LOG_DISPLAY_LENGTH > len - skip && i > 0;i--, ptr = ptr->next)
ADDRGP4 $2868
JUMPV
LABELV $2865
line 4663
;4663:  {
line 4664
;4664:    if (!ptr)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2869
line 4665
;4665:      break; // run out of log
ADDRGP4 $2947
JUMPV
LABELV $2869
line 4666
;4666:    *markstring = '\0'; // reinit markstring
ADDRLP4 4
CNSTI1 0
ASGNI1
line 4668
;4667:    // check team
;4668:    if ((team != PTE_NONE && team != BG_FindTeamForBuildable(ptr->buildable)) || (builder && builder != ptr->ent))
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $2874
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 2128
ADDRGP4 BG_FindTeamForBuildable
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
ADDRLP4 2128
INDIRI4
NEI4 $2873
LABELV $2874
ADDRLP4 2132
ADDRLP4 1040
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 2132
INDIRU4
CNSTU4 0
EQU4 $2871
ADDRLP4 2132
INDIRU4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
EQU4 $2871
LABELV $2873
line 4669
;4669:    {
line 4670
;4670:      skip++; // loop an extra time because we skipped one
ADDRLP4 1044
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4671
;4671:      continue;
ADDRGP4 $2866
JUMPV
LABELV $2871
line 4673
;4672:    }
;4673:    if (lastID < 0)
ADDRLP4 2084
INDIRI4
CNSTI4 0
GEI4 $2875
line 4674
;4674:      lastID = ptr->ID;
ADDRLP4 2084
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $2875
line 4675
;4675:    firstID = ptr->ID;
ADDRLP4 2096
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 4676
;4676:    matchlen++;
ADDRLP4 1048
ADDRLP4 1048
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4678
;4677:    // set name to the ent's current name or last recorded name
;4678:    if (ptr->ent)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2877
line 4679
;4679:    {
line 4680
;4680:      if (ptr->ent->client)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2879
line 4681
;4681:        name = ptr->ent->client->pers.netname;
ADDRLP4 2136
CNSTI4 516
ASGNI4
ADDRLP4 2080
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ADDRLP4 2136
INDIRI4
ADDP4
INDIRP4
ADDRLP4 2136
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $2878
JUMPV
LABELV $2879
line 4683
;4682:      else
;4683:        name = "<world>"; // any non-client action
ADDRLP4 2080
ADDRGP4 $2881
ASGNP4
line 4684
;4684:    }
ADDRGP4 $2878
JUMPV
LABELV $2877
line 4686
;4685:    else
;4686:      name = ptr->name;
ADDRLP4 2080
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
LABELV $2878
line 4687
;4687:    switch(ptr->fate)
ADDRLP4 2136
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
ADDRLP4 2136
INDIRI4
CNSTI4 0
LTI4 $2882
ADDRLP4 2136
INDIRI4
CNSTI4 3
GTI4 $2882
ADDRLP4 2136
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2894
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $2894
address $2885
address $2887
address $2889
address $2891
code
line 4688
;4688:    {
LABELV $2885
line 4690
;4689:      case BF_BUILT:
;4690:        action = "^2built^7 a";
ADDRLP4 2088
ADDRGP4 $2886
ASGNP4
line 4691
;4691:        break;
ADDRGP4 $2883
JUMPV
LABELV $2887
line 4693
;4692:      case BF_DECONNED:
;4693:        action = "^3DECONSTRUCTED^7 a";
ADDRLP4 2088
ADDRGP4 $2888
ASGNP4
line 4694
;4694:        break;
ADDRGP4 $2883
JUMPV
LABELV $2889
line 4696
;4695:      case BF_DESTROYED:
;4696:        action = "destroyed a";
ADDRLP4 2088
ADDRGP4 $2890
ASGNP4
line 4697
;4697:        break;
ADDRGP4 $2883
JUMPV
LABELV $2891
line 4699
;4698:      case BF_TEAMKILLED:
;4699:        action = "^1TEAMKILLED^7 a";
ADDRLP4 2088
ADDRGP4 $2892
ASGNP4
line 4700
;4700:        break;
ADDRGP4 $2883
JUMPV
LABELV $2882
line 4702
;4701:      default:
;4702:        action = "\0"; // erm
ADDRLP4 2088
ADDRGP4 $2893
ASGNP4
line 4703
;4703:        break;
LABELV $2883
line 4706
;4704:    }
;4705:    // handle buildables removed by markdecon
;4706:    if (ptr->marked)
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2895
line 4707
;4707:    {
line 4709
;4708:      buildHistory_t *mark;
;4709:      int j, markdecon[BA_NUM_BUILDABLES], and = 2;
ADDRLP4 2292
CNSTI4 2
ASGNI4
line 4711
;4710:      char bnames[32], *article;
;4711:      mark = ptr;
ADDRLP4 2256
ADDRLP4 0
INDIRP4
ASGNP4
line 4713
;4712:      // count the number of buildables
;4713:      memset(markdecon, 0, sizeof(markdecon));
ADDRLP4 2148
ARGP4
CNSTI4 0
ARGI4
CNSTI4 108
ARGI4
ADDRGP4 memset
CALLP4
pop
ADDRGP4 $2898
JUMPV
LABELV $2897
line 4715
;4714:      while((mark = mark->marked))
;4715:        markdecon[mark->buildable]++;
ADDRLP4 2300
ADDRLP4 2256
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2148
ADDP4
ASGNP4
ADDRLP4 2300
INDIRP4
ADDRLP4 2300
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2898
line 4714
ADDRLP4 2304
ADDRLP4 2256
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
ASGNP4
ADDRLP4 2256
ADDRLP4 2304
INDIRP4
ASGNP4
ADDRLP4 2304
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2897
line 4717
;4716:      // reverse order makes grammar easier
;4717:      for(j = BA_NUM_BUILDABLES;j >= 0;j--)
ADDRLP4 2144
CNSTI4 27
ASGNI4
LABELV $2900
line 4718
;4718:      {
line 4719
;4719:        buildablename = BG_FindHumanNameForBuildable(j);
ADDRLP4 2144
INDIRI4
ARGI4
ADDRLP4 2308
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 2308
INDIRP4
ASGNP4
line 4721
;4720:        // plural is easy
;4721:        if (markdecon[j] > 1)
ADDRLP4 2144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2148
ADDP4
INDIRI4
CNSTI4 1
LEI4 $2904
line 4722
;4722:          Com_sprintf(bnames, 32, "%d %ss", markdecon[j], buildablename);
ADDRLP4 2260
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $2906
ARGP4
ADDRLP4 2144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2148
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $2905
JUMPV
LABELV $2904
line 4724
;4723:        // use an appropriate article
;4724:        else if (markdecon[j] == 1)
ADDRLP4 2144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2148
ADDP4
INDIRI4
CNSTI4 1
NEI4 $2901
line 4725
;4725:        {
line 4726
;4726:          if (BG_FindUniqueTestForBuildable(j))
ADDRLP4 2144
INDIRI4
ARGI4
ADDRLP4 2312
ADDRGP4 BG_FindUniqueTestForBuildable
CALLI4
ASGNI4
ADDRLP4 2312
INDIRI4
CNSTI4 0
EQI4 $2909
line 4727
;4727:            article = "the"; // if only one
ADDRLP4 2296
ADDRGP4 $2911
ASGNP4
ADDRGP4 $2910
JUMPV
LABELV $2909
line 4728
;4728:          else if (strchr("aeiouAEIOU", *buildablename))
ADDRGP4 $2914
ARGP4
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 2316
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2316
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2912
line 4729
;4729:            article = "an"; // if first char is vowel
ADDRLP4 2296
ADDRGP4 $2915
ASGNP4
ADDRGP4 $2913
JUMPV
LABELV $2912
line 4731
;4730:          else
;4731:            article = "a";
ADDRLP4 2296
ADDRGP4 $2916
ASGNP4
LABELV $2913
LABELV $2910
line 4732
;4732:          Com_sprintf(bnames, 32, "%s %s", article, buildablename);
ADDRLP4 2260
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $2917
ARGP4
ADDRLP4 2296
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4733
;4733:        }
line 4735
;4734:        else
;4735:          continue; // none of this buildable
LABELV $2908
LABELV $2905
line 4741
;4736:        // C grammar: x, y, and z
;4737:        // the integer and is 2 initially, the test means it is used on the
;4738:        // second sprintf only, the reverse order makes this second to last
;4739:        // the comma is only printed if there is already some markstring i.e.
;4740:        // not the first time ( which would put it on the end of the string )
;4741:        Com_sprintf(markstring, sizeof(markstring), "%s%s %s%s", bnames, (*markstring) ? "," : "", (and-- == 1) ? "and " : "", markstring);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2918
ARGP4
ADDRLP4 2260
ARGP4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2923
ADDRLP4 2312
ADDRGP4 $2919
ASGNP4
ADDRGP4 $2924
JUMPV
LABELV $2923
ADDRLP4 2312
ADDRGP4 $93
ASGNP4
LABELV $2924
ADDRLP4 2312
INDIRP4
ARGP4
ADDRLP4 2320
ADDRLP4 2292
INDIRI4
ASGNI4
ADDRLP4 2324
CNSTI4 1
ASGNI4
ADDRLP4 2292
ADDRLP4 2320
INDIRI4
ADDRLP4 2324
INDIRI4
SUBI4
ASGNI4
ADDRLP4 2320
INDIRI4
ADDRLP4 2324
INDIRI4
NEI4 $2925
ADDRLP4 2316
ADDRGP4 $2921
ASGNP4
ADDRGP4 $2926
JUMPV
LABELV $2925
ADDRLP4 2316
ADDRGP4 $93
ASGNP4
LABELV $2926
ADDRLP4 2316
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4742
;4742:      }
LABELV $2901
line 4717
ADDRLP4 2144
ADDRLP4 2144
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 2144
INDIRI4
CNSTI4 0
GEI4 $2900
line 4743
;4743:    }
LABELV $2895
line 4744
;4744:    buildablename = BG_FindHumanNameForBuildable(ptr->buildable);
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 2144
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 2144
INDIRP4
ASGNP4
line 4745
;4745:    switch(BG_FindTeamForBuildable(ptr->buildable))
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 2152
ADDRGP4 BG_FindTeamForBuildable
CALLI4
ASGNI4
ADDRLP4 2148
ADDRLP4 2152
INDIRI4
ASGNI4
ADDRLP4 2148
INDIRI4
CNSTI4 1
EQI4 $2930
ADDRLP4 2148
INDIRI4
CNSTI4 2
EQI4 $2932
ADDRGP4 $2927
JUMPV
line 4746
;4746:    {
LABELV $2930
line 4748
;4747:      case PTE_ALIENS:
;4748:        teamchar = "^1A";
ADDRLP4 2092
ADDRGP4 $2931
ASGNP4
line 4749
;4749:        break;
ADDRGP4 $2928
JUMPV
LABELV $2932
line 4751
;4750:      case PTE_HUMANS:
;4751:        teamchar = "^4H";
ADDRLP4 2092
ADDRGP4 $2933
ASGNP4
line 4752
;4752:        break;
ADDRGP4 $2928
JUMPV
LABELV $2927
line 4754
;4753:      default:
;4754:        teamchar = " "; // space so it lines up neatly
ADDRLP4 2092
ADDRGP4 $486
ASGNP4
line 4755
;4755:        break;
LABELV $2928
line 4759
;4756:    }
;4757:    // prepend the information to the string as we go back in buildhistory
;4758:    // so the earliest events are at the top
;4759:    Com_sprintf(message, MAX_STRING_CHARS, "%3d %s^7 %s^7 %s%s %s%s%s\n%s", ptr->ID, teamchar, name, action, (strchr("aeiouAEIOU", buildablename[0])) ? "n"
ADDRGP4 $2914
ARGP4
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 2168
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2168
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2939
ADDRLP4 2160
ADDRGP4 $2935
ASGNP4
ADDRGP4 $2940
JUMPV
LABELV $2939
ADDRLP4 2160
ADDRGP4 $93
ASGNP4
LABELV $2940
ADDRLP4 1056
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $2934
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 2092
INDIRP4
ARGP4
ADDRLP4 2080
INDIRP4
ARGP4
ADDRLP4 2088
INDIRP4
ARGP4
ADDRLP4 2160
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $2941
ADDRLP4 2164
ADDRGP4 $2937
ASGNP4
ADDRGP4 $2942
JUMPV
LABELV $2941
ADDRLP4 2164
ADDRGP4 $93
ASGNP4
LABELV $2942
ADDRLP4 2164
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1056
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4761
;4760:        : "", buildablename, (markstring[0]) ? ", removing " : "", markstring, message);
;4761:  }
LABELV $2866
line 4662
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
LABELV $2868
ADDRLP4 1032
INDIRI4
CNSTI4 10
ADDI4
ADDRLP4 1052
INDIRI4
ADDRLP4 1044
INDIRI4
SUBI4
LEI4 $2943
ADDRLP4 1032
INDIRI4
CNSTI4 0
GTI4 $2865
LABELV $2943
line 4762
;4762:  for(;ptr;ptr = ptr->next)
ADDRGP4 $2947
JUMPV
LABELV $2944
line 4763
;4763:  {
line 4764
;4764:    if (builder && builder != ptr->ent)
ADDRLP4 2128
ADDRLP4 1040
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 2128
INDIRU4
CNSTU4 0
EQU4 $2948
ADDRLP4 2128
INDIRU4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
EQU4 $2948
line 4765
;4765:      continue;
ADDRGP4 $2945
JUMPV
LABELV $2948
line 4766
;4766:    if (team != PTE_NONE && team != BG_FindTeamForBuildable(ptr->buildable))
ADDRLP4 1036
INDIRI4
CNSTI4 0
EQI4 $2950
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 2136
ADDRGP4 BG_FindTeamForBuildable
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
ADDRLP4 2136
INDIRI4
EQI4 $2950
line 4767
;4767:      continue;
ADDRGP4 $2945
JUMPV
LABELV $2950
line 4768
;4768:    matchlen++;
ADDRLP4 1048
ADDRLP4 1048
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4769
;4769:  }
LABELV $2945
line 4762
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
LABELV $2947
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2944
line 4770
;4770:  if (matchlen)
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $2952
line 4771
;4771:    ADMP(va("%s^3!buildlog: showing log entries %d - %d of %d\n",
ADDRGP4 $2954
ARGP4
ADDRLP4 1056
ARGP4
ADDRLP4 2096
INDIRI4
ARGI4
ADDRLP4 2084
INDIRI4
ARGI4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRLP4 2128
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2128
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
ADDRGP4 $2953
JUMPV
LABELV $2952
line 4774
;4772:            message, firstID, lastID, matchlen));
;4773:    else
;4774:    ADMP("^3!buildlog: ^7no log entries match those criteria\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2955
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
LABELV $2953
line 4775
;4775:  return qtrue;
CNSTI4 1
RETI4
LABELV $2805
endproc G_admin_buildlog 3500 48
export G_admin_revert
proc G_admin_revert 1552 40
line 4780
;4776:}
;4777:
;4778:qboolean
;4779:G_admin_revert(gentity_t *ent, int skiparg)
;4780:{
line 4781
;4781:  int i = 0, j = 0, repeat = 1, ID = 0, len, matchlen = 0;
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 76
CNSTI4 0
ASGNI4
line 4782
;4782:  pTeam_t team = PTE_NONE;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 4783
;4783:  qboolean force = qfalse, reached = qfalse;
ADDRLP4 144
CNSTI4 0
ASGNI4
ADDRLP4 72
CNSTI4 0
ASGNI4
line 4784
;4784:  gentity_t *builder = NULL, *targ;
ADDRLP4 40
CNSTP4 0
ASGNP4
line 4788
;4785:  buildHistory_t *ptr, *tmp, *mark, *prev;
;4786:  vec3_t dist;
;4787:  char argbuf[64], *name, *bname, *action, *article;
;4788:  len = G_CountBuildLog();
ADDRLP4 152
ADDRGP4 G_CountBuildLog
CALLI4
ASGNI4
ADDRLP4 148
ADDRLP4 152
INDIRI4
ASGNI4
line 4789
;4789:  if (!len)
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $2957
line 4790
;4790:  {
line 4791
;4791:    ADMP("^3!revert: ^7no build log found\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2959
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4792
;4792:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2956
JUMPV
LABELV $2957
line 4794
;4793:  }
;4794:  if (g_survival.integer)
ADDRGP4 g_survival+12
INDIRI4
CNSTI4 0
EQI4 $2960
line 4795
;4795:  {
line 4796
;4796:    ADMP(
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2963
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4798
;4797:        "^3!revert: ^7cant use revert on survival mode, it fuck up everything\n");
;4798:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2956
JUMPV
LABELV $2960
line 4800
;4799:  }
;4800:  if (G_SayArgc() < 2 + skiparg)
ADDRLP4 156
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $2964
line 4801
;4801:  {
line 4802
;4802:    ADMP(
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2966
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4804
;4803:        "^3!revert: ^7usage: !revert (^5xnum^7) (^5#ID^7) (^5-name|num^7) (^5a|h^7)\n");
;4804:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2956
JUMPV
LABELV $2964
line 4806
;4805:  }
;4806:  for(i = 1;i + skiparg < G_SayArgc();i++)
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRGP4 $2970
JUMPV
LABELV $2967
line 4807
;4807:  {
line 4810
;4808:    char arg[64], err[MAX_STRING_CHARS];
;4809:    int pids[MAX_CLIENTS];
;4810:    G_SayArgv(i + skiparg, arg, sizeof arg);
ADDRLP4 36
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ARGI4
ADDRLP4 160
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 4811
;4811:    switch(arg[0])
ADDRLP4 1504
ADDRLP4 160
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1512
CNSTI4 72
ASGNI4
ADDRLP4 1504
INDIRI4
ADDRLP4 1512
INDIRI4
EQI4 $2983
ADDRLP4 1504
INDIRI4
ADDRLP4 1512
INDIRI4
GTI4 $2986
LABELV $2985
ADDRLP4 1520
CNSTI4 45
ASGNI4
ADDRLP4 1504
INDIRI4
ADDRLP4 1520
INDIRI4
EQI4 $2978
ADDRLP4 1504
INDIRI4
ADDRLP4 1520
INDIRI4
GTI4 $2988
LABELV $2987
ADDRLP4 1504
INDIRI4
CNSTI4 33
EQI4 $2984
ADDRLP4 1504
INDIRI4
CNSTI4 35
EQI4 $2976
ADDRGP4 $2971
JUMPV
LABELV $2988
ADDRLP4 1504
INDIRI4
CNSTI4 65
EQI4 $2982
ADDRGP4 $2971
JUMPV
LABELV $2986
ADDRLP4 1532
CNSTI4 104
ASGNI4
ADDRLP4 1504
INDIRI4
ADDRLP4 1532
INDIRI4
EQI4 $2983
ADDRLP4 1504
INDIRI4
ADDRLP4 1532
INDIRI4
GTI4 $2990
LABELV $2989
ADDRLP4 1504
INDIRI4
CNSTI4 97
EQI4 $2982
ADDRGP4 $2971
JUMPV
LABELV $2990
ADDRLP4 1504
INDIRI4
CNSTI4 120
EQI4 $2974
ADDRGP4 $2971
JUMPV
line 4812
;4812:    {
LABELV $2974
line 4814
;4813:      case 'x':
;4814:        repeat = atoi(arg + 1);
ADDRLP4 160+1
ARGP4
ADDRLP4 1536
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 1536
INDIRI4
ASGNI4
line 4815
;4815:        break;
ADDRGP4 $2972
JUMPV
LABELV $2976
line 4817
;4816:      case '#':
;4817:        ID = atoi(arg + 1);
ADDRLP4 160+1
ARGP4
ADDRLP4 1540
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 56
ADDRLP4 1540
INDIRI4
ASGNI4
line 4818
;4818:        break;
ADDRGP4 $2972
JUMPV
LABELV $2978
line 4820
;4819:      case '-':
;4820:        if (G_ClientNumbersFromString(arg + 1, pids) != 1)
ADDRLP4 160+1
ARGP4
ADDRLP4 224
ARGP4
ADDRLP4 1544
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 1544
INDIRI4
CNSTI4 1
EQI4 $2979
line 4821
;4821:        {
line 4822
;4822:          G_MatchOnePlayer(pids, err, sizeof err);
ADDRLP4 224
ARGP4
ADDRLP4 480
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLI4
pop
line 4823
;4823:          ADMP(va("^3!revert: ^7%s\n", err));
ADDRGP4 $2826
ARGP4
ADDRLP4 480
ARGP4
ADDRLP4 1548
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1548
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4824
;4824:          return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2956
JUMPV
LABELV $2979
line 4826
;4825:        }
;4826:        builder = g_entities + *pids;
ADDRLP4 40
CNSTI4 2476
ADDRLP4 224
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 4827
;4827:        break;
ADDRGP4 $2972
JUMPV
LABELV $2982
line 4830
;4828:      case 'A':
;4829:      case 'a':
;4830:        team = PTE_ALIENS;
ADDRLP4 44
CNSTI4 1
ASGNI4
line 4831
;4831:        break;
ADDRGP4 $2972
JUMPV
LABELV $2983
line 4834
;4832:      case 'H':
;4833:      case 'h':
;4834:        team = PTE_HUMANS;
ADDRLP4 44
CNSTI4 2
ASGNI4
line 4835
;4835:        break;
ADDRGP4 $2972
JUMPV
LABELV $2984
line 4837
;4836:      case '!':
;4837:        force = qtrue;
ADDRLP4 144
CNSTI4 1
ASGNI4
line 4838
;4838:        break;
ADDRGP4 $2972
JUMPV
LABELV $2971
line 4840
;4839:      default:
;4840:        ADMP(
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2966
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4842
;4841:            "^3!revert: ^7usage: !revert (^5xnum^7) (^5#ID^7) (^5-name|num^7) (^5a|h^7)\n");
;4842:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2956
JUMPV
LABELV $2972
line 4844
;4843:    }
;4844:  }
LABELV $2968
line 4806
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $2970
ADDRLP4 160
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ADDRLP4 160
INDIRI4
LTI4 $2967
line 4845
;4845:  if (repeat > 25)
ADDRLP4 16
INDIRI4
CNSTI4 25
LEI4 $2991
line 4846
;4846:  {
line 4847
;4847:    ADMP(
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2993
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4849
;4848:        "^3!revert: ^7to avoid flooding, can only revert 25 builds at a time\n");
;4849:    repeat = 25;
ADDRLP4 16
CNSTI4 25
ASGNI4
line 4850
;4850:  }
LABELV $2991
line 4851
;4851:  for(i = 0, ptr = prev = level.buildHistory;repeat > 0;repeat--, j = 0)
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 164
ADDRGP4 level+189972
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 164
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 164
INDIRP4
ASGNP4
ADDRGP4 $2997
JUMPV
LABELV $2994
line 4852
;4852:  {
line 4853
;4853:    if (!ptr)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2999
line 4854
;4854:      break; // run out of bhist
ADDRGP4 $2996
JUMPV
LABELV $2999
line 4855
;4855:    if (!reached && ID)
ADDRLP4 168
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRI4
ADDRLP4 168
INDIRI4
NEI4 $3001
ADDRLP4 56
INDIRI4
ADDRLP4 168
INDIRI4
EQI4 $3001
line 4856
;4856:    {
line 4857
;4857:      if (ptr->ID == ID)
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $3003
line 4858
;4858:        reached = qtrue;
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRGP4 $3004
JUMPV
LABELV $3003
line 4860
;4859:      else
;4860:      {
line 4861
;4861:        prev = ptr;
ADDRLP4 60
ADDRLP4 0
INDIRP4
ASGNP4
line 4862
;4862:        ptr = ptr->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
line 4863
;4863:        repeat++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4864
;4864:        continue;
ADDRGP4 $2995
JUMPV
LABELV $3004
line 4866
;4865:      }
;4866:    }
LABELV $3001
line 4867
;4867:    if ((team != PTE_NONE && team != BG_FindTeamForBuildable(ptr->buildable)) || (builder && builder != ptr->ent))
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $3008
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 176
ADDRGP4 BG_FindTeamForBuildable
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRLP4 176
INDIRI4
NEI4 $3007
LABELV $3008
ADDRLP4 180
ADDRLP4 40
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 180
INDIRU4
CNSTU4 0
EQU4 $3005
ADDRLP4 180
INDIRU4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
EQU4 $3005
LABELV $3007
line 4868
;4868:    {
line 4870
;4869:      // team doesn't match, so skip this ptr and reset prev
;4870:      prev = ptr;
ADDRLP4 60
ADDRLP4 0
INDIRP4
ASGNP4
line 4871
;4871:      ptr = ptr->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
line 4873
;4872:      // we don't want to count this one so counteract the decrement by the for
;4873:      repeat++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4874
;4874:      continue;
ADDRGP4 $2995
JUMPV
LABELV $3005
line 4877
;4875:    }
;4876:    // get the ent's current or last recorded name
;4877:    if (ptr->ent)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3009
line 4878
;4878:    {
line 4879
;4879:      if (ptr->ent->client)
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3011
line 4880
;4880:        name = ptr->ent->client->pers.netname;
ADDRLP4 184
CNSTI4 516
ASGNI4
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ADDRLP4 184
INDIRI4
ADDP4
INDIRP4
ADDRLP4 184
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $3010
JUMPV
LABELV $3011
line 4882
;4881:      else
;4882:        name = "<world>"; // non-client actions
ADDRLP4 32
ADDRGP4 $2881
ASGNP4
line 4883
;4883:    }
ADDRGP4 $3010
JUMPV
LABELV $3009
line 4885
;4884:    else
;4885:      name = ptr->name;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
LABELV $3010
line 4886
;4886:    bname = BG_FindHumanNameForBuildable(ptr->buildable);
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 184
ADDRGP4 BG_FindHumanNameForBuildable
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 184
INDIRP4
ASGNP4
line 4887
;4887:    action = "";
ADDRLP4 48
ADDRGP4 $93
ASGNP4
line 4888
;4888:    switch(ptr->fate)
ADDRLP4 188
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
LTI4 $3013
ADDRLP4 188
INDIRI4
CNSTI4 3
GTI4 $3013
ADDRLP4 188
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $3115
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $3115
address $3016
address $3076
address $3084
address $3080
code
line 4889
;4889:    {
LABELV $3016
line 4891
;4890:      case BF_BUILT:
;4891:        action = "^2build^7";
ADDRLP4 48
ADDRGP4 $3017
ASGNP4
line 4892
;4892:        for(j = MAX_CLIENTS, targ = g_entities + j;j < level.num_entities;j++, targ++)
ADDRLP4 8
CNSTI4 64
ASGNI4
ADDRLP4 4
CNSTI4 2476
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $3021
JUMPV
LABELV $3018
line 4893
;4893:        {
line 4895
;4894:          // easy checks first to save time
;4895:          if (targ->s.eType != ET_BUILDABLE)
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $3023
line 4896
;4896:            continue;
ADDRGP4 $3019
JUMPV
LABELV $3023
line 4897
;4897:          if (targ->s.modelindex != ptr->buildable)
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
EQI4 $3025
line 4898
;4898:            continue;
ADDRGP4 $3019
JUMPV
LABELV $3025
line 4899
;4899:          VectorSubtract(targ->s.pos.trBase, ptr->origin, dist);
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 20+8
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRF4
SUBF4
ASGNF4
line 4901
;4900:#define FIND_BUILDABLE_TOLERANCE 5
;4901:          if (VectorLength(dist) > FIND_BUILDABLE_TOLERANCE)
ADDRLP4 20
ARGP4
ADDRLP4 204
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 204
INDIRF4
CNSTF4 1084227584
LEF4 $3029
line 4902
;4902:            continue; // number is somewhat arbitrary, watch for false pos/neg
ADDRGP4 $3019
JUMPV
LABELV $3029
line 4905
;4903:          // if we didn't continue then it's this one, unlink it but we can't
;4904:          // free it yet, because the markdecon buildables might not place
;4905:          trap_UnlinkEntity(targ);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 4906
;4906:          break;
ADDRGP4 $3020
JUMPV
LABELV $3019
line 4892
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $3021
ADDRLP4 8
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $3018
LABELV $3020
line 4910
;4907:        }
;4908:        // if there are marked buildables to replace, and we aren't overriding
;4909:        // space check, check they can fit before acting
;4910:        if (ptr->marked && !force)
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3031
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $3031
line 4911
;4911:        {
line 4912
;4912:          for(mark = ptr->marked;mark;mark = mark->marked)
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $3036
JUMPV
LABELV $3033
line 4913
;4913:            if (!G_RevertCanFit(mark))
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 G_RevertCanFit
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
NEI4 $3037
line 4914
;4914:            {
line 4915
;4915:              trap_LinkEntity(targ); // put it back, we failed
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 4917
;4916:              // scariest sprintf ever:
;4917:              Com_sprintf(argbuf, sizeof argbuf, "%s%s%s%s%s%s%s!", (repeat > 1) ? "x" : "", (repeat > 1) ? va("%d ", repeat) : "", (ID) ? "#" : "", (ID) ? va(
ADDRLP4 16
INDIRI4
CNSTI4 1
LEI4 $3053
ADDRGP4 $3042
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 232
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 232
INDIRP4
ASGNP4
ADDRGP4 $3054
JUMPV
LABELV $3053
ADDRLP4 200
ADDRGP4 $93
ASGNP4
LABELV $3054
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $3055
ADDRGP4 $3042
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 236
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 204
ADDRLP4 236
INDIRP4
ASGNP4
ADDRGP4 $3056
JUMPV
LABELV $3055
ADDRLP4 204
ADDRGP4 $93
ASGNP4
LABELV $3056
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3057
ADDRGP4 $3042
ARGP4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRLP4 240
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 208
ADDRLP4 240
INDIRP4
ASGNP4
ADDRGP4 $3058
JUMPV
LABELV $3057
ADDRLP4 208
ADDRGP4 $93
ASGNP4
LABELV $3058
ADDRLP4 80
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3039
ARGP4
ADDRLP4 16
INDIRI4
CNSTI4 1
LEI4 $3059
ADDRLP4 212
ADDRGP4 $3040
ASGNP4
ADDRGP4 $3060
JUMPV
LABELV $3059
ADDRLP4 212
ADDRGP4 $93
ASGNP4
LABELV $3060
ADDRLP4 212
INDIRP4
ARGP4
ADDRLP4 200
INDIRP4
ARGP4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $3061
ADDRLP4 216
ADDRGP4 $3044
ASGNP4
ADDRGP4 $3062
JUMPV
LABELV $3061
ADDRLP4 216
ADDRGP4 $93
ASGNP4
LABELV $3062
ADDRLP4 216
INDIRP4
ARGP4
ADDRLP4 204
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3063
ADDRLP4 220
ADDRGP4 $1277
ASGNP4
ADDRGP4 $3064
JUMPV
LABELV $3063
ADDRLP4 220
ADDRGP4 $93
ASGNP4
LABELV $3064
ADDRLP4 220
INDIRP4
ARGP4
ADDRLP4 208
INDIRP4
ARGP4
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $3065
ADDRLP4 224
ADDRGP4 $3049
ASGNP4
ADDRGP4 $3066
JUMPV
LABELV $3065
ADDRLP4 44
INDIRI4
CNSTI4 2
NEI4 $3067
ADDRLP4 228
ADDRGP4 $3050
ASGNP4
ADDRGP4 $3068
JUMPV
LABELV $3067
ADDRLP4 228
ADDRGP4 $93
ASGNP4
LABELV $3068
ADDRLP4 224
ADDRLP4 228
INDIRP4
ASGNP4
LABELV $3066
ADDRLP4 224
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4920
;4918:                  "%d ", ptr->ID) : "", (builder) ? "-" : "", (builder) ? va("%d ", builder - g_entities) : "", (team == PTE_ALIENS) ? "a " : (team
;4919:                  == PTE_HUMANS) ? "h " : "");
;4920:              ADMP(va(
ADDRGP4 $3069
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 244
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 244
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4924
;4921:                      "^3!revert: ^7revert aborted: reverting this %s would conflict with "
;4922:                      "another buildable, use ^3!revert %s ^7to override\n",
;4923:                      action, argbuf));
;4924:              return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2956
JUMPV
LABELV $3037
LABELV $3034
line 4912
ADDRLP4 12
ADDRLP4 12
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
ASGNP4
LABELV $3036
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3033
line 4926
;4925:            }
;4926:        }
LABELV $3031
line 4928
;4927:        // if we haven't returned yet then we're good to go, free it
;4928:        G_FreeEntity(targ);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 4930
;4929:        // put the marked buildables back and mark them again
;4930:        if (ptr->marked) // there may be a more efficient way of doing this
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3014
line 4931
;4931:        {
line 4932
;4932:          for(mark = ptr->marked;mark;mark = mark->marked)
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $3075
JUMPV
LABELV $3072
line 4933
;4933:            G_SpawnRevertedBuildable(mark, qtrue);
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 G_SpawnRevertedBuildable
CALLV
pop
LABELV $3073
line 4932
ADDRLP4 12
ADDRLP4 12
INDIRP4
CNSTI4 104
ADDP4
INDIRP4
ASGNP4
LABELV $3075
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3072
line 4934
;4934:        }
line 4935
;4935:        break;
ADDRGP4 $3014
JUMPV
LABELV $3076
line 4937
;4936:      case BF_DECONNED:
;4937:        if (!action[0])
ADDRLP4 48
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3077
line 4938
;4938:          action = "^3deconstruction^7";
ADDRLP4 48
ADDRGP4 $3079
ASGNP4
LABELV $3077
LABELV $3080
line 4940
;4939:      case BF_TEAMKILLED:
;4940:        if (!action[0])
ADDRLP4 48
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3081
line 4941
;4941:          action = "^1TEAMKILL^7";
ADDRLP4 48
ADDRGP4 $3083
ASGNP4
LABELV $3081
LABELV $3084
line 4943
;4942:      case BF_DESTROYED:
;4943:        if (!action[0])
ADDRLP4 48
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3085
line 4944
;4944:          action = "destruction";
ADDRLP4 48
ADDRGP4 $3087
ASGNP4
LABELV $3085
line 4946
;4945:        // if we're not overriding and the replacement can't fit, as before
;4946:        if (!force && !G_RevertCanFit(ptr))
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $3088
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 G_RevertCanFit
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
NEI4 $3088
line 4947
;4947:        {
line 4948
;4948:          Com_sprintf(argbuf, sizeof argbuf, "%s%s%s%s%s%s%s!", (repeat > 1) ? "x" : "", (repeat > 1) ? va("%d ", repeat) : "", (ID) ? "#" : "", (ID) ? va(
ADDRLP4 16
INDIRI4
CNSTI4 1
LEI4 $3098
ADDRGP4 $3042
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 232
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 200
ADDRLP4 232
INDIRP4
ASGNP4
ADDRGP4 $3099
JUMPV
LABELV $3098
ADDRLP4 200
ADDRGP4 $93
ASGNP4
LABELV $3099
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $3100
ADDRGP4 $3042
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 236
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 204
ADDRLP4 236
INDIRP4
ASGNP4
ADDRGP4 $3101
JUMPV
LABELV $3100
ADDRLP4 204
ADDRGP4 $93
ASGNP4
LABELV $3101
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3102
ADDRGP4 $3042
ARGP4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRLP4 240
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 208
ADDRLP4 240
INDIRP4
ASGNP4
ADDRGP4 $3103
JUMPV
LABELV $3102
ADDRLP4 208
ADDRGP4 $93
ASGNP4
LABELV $3103
ADDRLP4 80
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $3039
ARGP4
ADDRLP4 16
INDIRI4
CNSTI4 1
LEI4 $3104
ADDRLP4 212
ADDRGP4 $3040
ASGNP4
ADDRGP4 $3105
JUMPV
LABELV $3104
ADDRLP4 212
ADDRGP4 $93
ASGNP4
LABELV $3105
ADDRLP4 212
INDIRP4
ARGP4
ADDRLP4 200
INDIRP4
ARGP4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $3106
ADDRLP4 216
ADDRGP4 $3044
ASGNP4
ADDRGP4 $3107
JUMPV
LABELV $3106
ADDRLP4 216
ADDRGP4 $93
ASGNP4
LABELV $3107
ADDRLP4 216
INDIRP4
ARGP4
ADDRLP4 204
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3108
ADDRLP4 220
ADDRGP4 $1277
ASGNP4
ADDRGP4 $3109
JUMPV
LABELV $3108
ADDRLP4 220
ADDRGP4 $93
ASGNP4
LABELV $3109
ADDRLP4 220
INDIRP4
ARGP4
ADDRLP4 208
INDIRP4
ARGP4
ADDRLP4 44
INDIRI4
CNSTI4 1
NEI4 $3110
ADDRLP4 224
ADDRGP4 $3049
ASGNP4
ADDRGP4 $3111
JUMPV
LABELV $3110
ADDRLP4 44
INDIRI4
CNSTI4 2
NEI4 $3112
ADDRLP4 228
ADDRGP4 $3050
ASGNP4
ADDRGP4 $3113
JUMPV
LABELV $3112
ADDRLP4 228
ADDRGP4 $93
ASGNP4
LABELV $3113
ADDRLP4 224
ADDRLP4 228
INDIRP4
ASGNP4
LABELV $3111
ADDRLP4 224
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 4951
;4949:              "%d ", ptr->ID) : "", (builder) ? "-" : "", (builder) ? va("%d ", builder - g_entities) : "", (team == PTE_ALIENS) ? "a "
;4950:              : (team == PTE_HUMANS) ? "h " : "");
;4951:          ADMP(
ADDRGP4 $3069
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 244
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 244
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4956
;4952:              va(
;4953:                  "^3!revert: ^7revert aborted: reverting this %s would "
;4954:                  "conflict with another buildable, use ^3!revert %s ^7to override\n",
;4955:                  action, argbuf));
;4956:          return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2956
JUMPV
LABELV $3088
line 4960
;4957:        }
;4958:        // else replace it but don't mark it ( it might have been marked before
;4959:        // but it isn't that important )
;4960:        G_SpawnRevertedBuildable(ptr, qfalse);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_SpawnRevertedBuildable
CALLV
pop
line 4961
;4961:        break;
ADDRGP4 $3014
JUMPV
LABELV $3013
line 4964
;4962:      default:
;4963:        // if this happens something has gone wrong
;4964:        ADMP("^3!revert: ^7incomplete or corrupted build log entry\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3114
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4969
;4965:        /* quarantine and dispose of the log, it's dangerous
;4966:         trap_Cvar_Set( "g_buildLogMaxLength", "0" );
;4967:         G_CountBuildLog( );
;4968:         */
;4969:        return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2956
JUMPV
LABELV $3014
line 4971
;4970:    }
;4971:    if (j == level.num_entities)
ADDRLP4 8
INDIRI4
ADDRGP4 level+12
INDIRI4
NEI4 $3116
line 4972
;4972:    {
line 4973
;4973:      ADMP(va("^3!revert: ^7could not find logged buildable #%d\n", ptr->ID));
ADDRGP4 $3119
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 196
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 4974
;4974:      prev = ptr;
ADDRLP4 60
ADDRLP4 0
INDIRP4
ASGNP4
line 4975
;4975:      ptr = ptr->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
line 4976
;4976:      continue;
ADDRGP4 $2995
JUMPV
LABELV $3116
line 4979
;4977:    }
;4978:    // this is similar to the buildlog stuff
;4979:    if (BG_FindUniqueTestForBuildable(ptr->buildable))
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 196
ADDRGP4 BG_FindUniqueTestForBuildable
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
EQI4 $3120
line 4980
;4980:      article = "the";
ADDRLP4 68
ADDRGP4 $2911
ASGNP4
ADDRGP4 $3121
JUMPV
LABELV $3120
line 4981
;4981:    else if (strchr("aeiouAEIOU", *bname))
ADDRGP4 $2914
ARGP4
ADDRLP4 52
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 200
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 200
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3122
line 4982
;4982:      article = "an";
ADDRLP4 68
ADDRGP4 $2915
ASGNP4
ADDRGP4 $3123
JUMPV
LABELV $3122
line 4984
;4983:    else
;4984:      article = "a";
ADDRLP4 68
ADDRGP4 $2916
ASGNP4
LABELV $3123
LABELV $3121
line 4985
;4985:    AP(va("print \"%s^7 reverted %s^7'%s %s of %s %s\n\"",
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3128
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 212
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 204
ADDRLP4 212
INDIRP4
ASGNP4
ADDRGP4 $3129
JUMPV
LABELV $3128
ADDRLP4 204
ADDRGP4 $342
ASGNP4
LABELV $3129
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 216
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $3126
ARGP4
ADDRLP4 216
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 32
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 220
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 220
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3130
ADDRLP4 208
ADDRGP4 $93
ASGNP4
ADDRGP4 $3131
JUMPV
LABELV $3130
ADDRLP4 208
ADDRGP4 $168
ASGNP4
LABELV $3131
ADDRGP4 $3124
ARGP4
ADDRLP4 204
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 208
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 224
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 224
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 4988
;4986:            (ent) ? G_admin_adminPrintName(ent) : "console", name, strchr("Ss",
;4987:                name[strlen(name) - 1]) ? "" : "s", action, article, bname));
;4988:    matchlen++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4992
;4989:    // remove the reverted entry
;4990:    // ptr moves on, prev just readjusts ->next unless it is about to be
;4991:    // freed, in which case it is forced to move on too
;4992:    tmp = ptr;
ADDRLP4 64
ADDRLP4 0
INDIRP4
ASGNP4
line 4993
;4993:    if (ptr == level.buildHistory)
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level+189972
INDIRP4
CVPU4 4
NEU4 $3132
line 4994
;4994:      prev = level.buildHistory = ptr = ptr->next;
ADDRLP4 228
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 228
INDIRP4
ASGNP4
ADDRGP4 level+189972
ADDRLP4 228
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 228
INDIRP4
ASGNP4
ADDRGP4 $3133
JUMPV
LABELV $3132
line 4996
;4995:    else
;4996:      prev->next = ptr = ptr->next;
ADDRLP4 232
CNSTI4 100
ASGNI4
ADDRLP4 236
ADDRLP4 0
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 236
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
ADDRLP4 236
INDIRP4
ASGNP4
LABELV $3133
line 4997
;4997:    G_Free(tmp);
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 G_Free
CALLV
pop
line 4998
;4998:  }
LABELV $2995
line 4851
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $2997
ADDRLP4 16
INDIRI4
CNSTI4 0
GTI4 $2994
LABELV $2996
line 4999
;4999:  if (ID && !reached)
ADDRLP4 168
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRI4
ADDRLP4 168
INDIRI4
EQI4 $3136
ADDRLP4 72
INDIRI4
ADDRLP4 168
INDIRI4
NEI4 $3136
line 5000
;5000:  {
line 5001
;5001:    ADMP("^3!revert: ^7no buildlog entry with that ID\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3138
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5002
;5002:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2956
JUMPV
LABELV $3136
line 5005
;5003:  }
;5004:
;5005:  if (!matchlen)
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $3139
line 5006
;5006:  {
line 5007
;5007:    ADMP("^3!revert: ^7no log entries match those criteria\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3141
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5008
;5008:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2956
JUMPV
LABELV $3139
line 5011
;5009:  }
;5010:  else
;5011:  {
line 5012
;5012:    ADMP(va("^3!revert: ^7reverted %d buildlog events\n", matchlen));
ADDRGP4 $3142
ARGP4
ADDRLP4 76
INDIRI4
ARGI4
ADDRLP4 172
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5013
;5013:  }
line 5015
;5014:
;5015:  return qtrue;
CNSTI4 1
RETI4
LABELV $2956
endproc G_admin_revert 1552 40
export G_admin_info
proc G_admin_info 1336 16
line 5025
;5016:}
;5017:
;5018:void
;5019:G_Unescape(char *input, char *output, int len);
;5020:qboolean
;5021:G_StringReplaceCvars(char *input, char *output, int len);
;5022:
;5023:qboolean
;5024:G_admin_info(gentity_t *ent, int skiparg)
;5025:{
line 5029
;5026:  fileHandle_t infoFile;
;5027:  int length;
;5028:  char filename[MAX_OSPATH], message[MAX_STRING_CHARS];
;5029:  if (G_SayArgc() == 2 + skiparg)
ADDRLP4 1288
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 1288
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
NEI4 $3144
line 5030
;5030:    G_SayArgv(1 + skiparg, filename, sizeof(filename));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1024
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
ADDRGP4 $3145
JUMPV
LABELV $3144
line 5031
;5031:  else if (G_SayArgc() == 1 + skiparg)
ADDRLP4 1292
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 1292
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
NEI4 $3146
line 5032
;5032:    Q_strncpyz(filename, "default", sizeof(filename));
ADDRLP4 1024
ARGP4
ADDRGP4 $3148
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $3147
JUMPV
LABELV $3146
line 5034
;5033:  else
;5034:  {
line 5035
;5035:    ADMP("^3!info: ^7usage: ^3!info ^7(^5subject^7)\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3149
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5036
;5036:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3143
JUMPV
LABELV $3147
LABELV $3145
line 5038
;5037:  }
;5038:  Com_sprintf(filename, sizeof(filename), "info/info-%s.txt", filename);
ADDRLP4 1024
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $3150
ARGP4
ADDRLP4 1024
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5039
;5039:  length = trap_FS_FOpenFile(filename, &infoFile, FS_READ);
ADDRLP4 1024
ARGP4
ADDRLP4 1280
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1296
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1284
ADDRLP4 1296
INDIRI4
ASGNI4
line 5040
;5040:  if (length <= 0 || !infoFile)
ADDRLP4 1300
CNSTI4 0
ASGNI4
ADDRLP4 1284
INDIRI4
ADDRLP4 1300
INDIRI4
LEI4 $3153
ADDRLP4 1280
INDIRI4
ADDRLP4 1300
INDIRI4
NEI4 $3151
LABELV $3153
line 5041
;5041:  {
line 5042
;5042:    trap_FS_FCloseFile(infoFile);
ADDRLP4 1280
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 5043
;5043:    ADMP("^3!info: ^7no relevant information is available\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3154
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5044
;5044:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3143
JUMPV
LABELV $3151
line 5047
;5045:  }
;5046:  else
;5047:  {
line 5050
;5048:    int i;
;5049:    char *cr;
;5050:    trap_FS_Read(message, sizeof(message), infoFile);
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1280
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 5051
;5051:    if (length < sizeof(message))
ADDRLP4 1284
INDIRI4
CVIU4 4
CNSTU4 1024
GEU4 $3155
line 5052
;5052:      message[length] = '\0';
ADDRLP4 1284
INDIRI4
ADDRLP4 0
ADDP4
CNSTI1 0
ASGNI1
ADDRGP4 $3156
JUMPV
LABELV $3155
line 5054
;5053:    else
;5054:      message[sizeof(message) - 1] = '\0';
ADDRLP4 0+1023
CNSTI1 0
ASGNI1
LABELV $3156
line 5055
;5055:    trap_FS_FCloseFile(infoFile);
ADDRLP4 1280
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
ADDRGP4 $3159
JUMPV
LABELV $3158
line 5058
;5056:    // strip carriage returns for windows platforms
;5057:    while((cr = strchr(message, '\r')))
;5058:      memmove(cr, cr + 1, strlen(cr + 1) + 1);
ADDRLP4 1304
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 1312
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1304
INDIRP4
ARGP4
ADDRLP4 1320
CNSTI4 1
ASGNI4
ADDRLP4 1304
INDIRP4
ADDRLP4 1320
INDIRI4
ADDP4
ARGP4
ADDRLP4 1312
INDIRI4
ADDRLP4 1320
INDIRI4
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
LABELV $3159
line 5057
ADDRLP4 0
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 1324
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1304
ADDRLP4 1324
INDIRP4
ASGNP4
ADDRLP4 1324
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3158
line 5060
;5059:#define MAX_INFO_PARSE_LOOPS 100
;5060:    for(i = 0;i < MAX_INFO_PARSE_LOOPS && G_StringReplaceCvars(message, message, sizeof(message));i++)
ADDRLP4 1308
CNSTI4 0
ASGNI4
ADDRGP4 $3164
JUMPV
LABELV $3161
line 5061
;5061:      ;
LABELV $3162
line 5060
ADDRLP4 1308
ADDRLP4 1308
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3164
ADDRLP4 1308
INDIRI4
CNSTI4 100
GEI4 $3165
ADDRLP4 0
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1328
ADDRGP4 G_StringReplaceCvars
CALLI4
ASGNI4
ADDRLP4 1328
INDIRI4
CNSTI4 0
NEI4 $3161
LABELV $3165
line 5062
;5062:    G_Unescape(message, message, sizeof(message));
ADDRLP4 0
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_Unescape
CALLV
pop
line 5063
;5063:    if (i == MAX_INFO_PARSE_LOOPS)
ADDRLP4 1308
INDIRI4
CNSTI4 100
NEI4 $3166
line 5064
;5064:      G_Printf(S_COLOR_YELLOW "WARNING: %s exceeds MAX_INFO_PARSE_LOOPS\n", filename);
ADDRGP4 $3168
ARGP4
ADDRLP4 1024
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $3166
line 5065
;5065:    ADMP(va("%s\n", message));
ADDRGP4 $636
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1332
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1332
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5066
;5066:    return qtrue;
CNSTI4 1
RETI4
LABELV $3143
endproc G_admin_info 1336 16
export G_Unescape
proc G_Unescape 16 0
line 5072
;5067:  }
;5068:}
;5069:
;5070:void
;5071:G_Unescape(char *input, char *output, int len)
;5072:{
line 5080
;5073:  // \n -> newline, \%c -> %c
;5074:  // output is terminated at output[len - 1]
;5075:  // it's OK for input to equal output, because our position in input is always
;5076:  // equal or greater than our position in output
;5077:  // however, if output is later in the same string as input, a crash is pretty
;5078:  // much inevitable
;5079:  int i, j;
;5080:  for(i = j = 0;input[i] && j + 1 < len;i++, j++)
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $3173
JUMPV
LABELV $3170
line 5081
;5081:  {
line 5082
;5082:    if (input[i] == '\\')
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $3174
line 5083
;5083:    {
line 5084
;5084:      if (!input[++i])
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3176
line 5085
;5085:      {
line 5086
;5086:        output[j] = '\0';
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 5087
;5087:        return;
ADDRGP4 $3169
JUMPV
LABELV $3176
line 5089
;5088:      }
;5089:      else if (input[i] == 'n')
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 110
NEI4 $3178
line 5090
;5090:        output[j] = '\n';
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 10
ASGNI1
ADDRGP4 $3175
JUMPV
LABELV $3178
line 5092
;5091:      else
;5092:        output[j] = input[i];
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 5093
;5093:    }
ADDRGP4 $3175
JUMPV
LABELV $3174
line 5095
;5094:    else
;5095:      output[j] = input[i];
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
LABELV $3175
line 5096
;5096:  }
LABELV $3171
line 5080
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
LABELV $3173
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $3180
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRFP4 8
INDIRI4
LTI4 $3170
LABELV $3180
line 5097
;5097:  output[j] = '\0';
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 5098
;5098:}
LABELV $3169
endproc G_Unescape 16 0
export G_StringReplaceCvars
proc G_StringReplaceCvars 372 12
line 5102
;5099:
;5100:qboolean
;5101:G_StringReplaceCvars(char *input, char *output, int len)
;5102:{
line 5103
;5103:  int i, outNum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 5106
;5104:  char cvarName[64], cvarValue[MAX_CVAR_VALUE_STRING];
;5105:  char *outputBuffer;
;5106:  qboolean doneAnything = qfalse;
ADDRLP4 332
CNSTI4 0
ASGNI4
line 5107
;5107:  if (len <= 0)
ADDRFP4 8
INDIRI4
CNSTI4 0
GTI4 $3182
line 5108
;5108:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3181
JUMPV
LABELV $3182
line 5110
;5109:  // use our own internal buffer in case output == input
;5110:  outputBuffer = G_Alloc(len);
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 336
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 328
ADDRLP4 336
INDIRP4
ASGNP4
line 5111
;5111:  len -= 1; // fit in a terminator
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $3185
JUMPV
LABELV $3184
line 5113
;5112:  while(*input && outNum < len)
;5113:  {
line 5114
;5114:    if (*input == '\\' && input[1] && outNum < len - 1)
ADDRLP4 340
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 340
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $3187
ADDRLP4 344
CNSTI4 1
ASGNI4
ADDRLP4 340
INDIRP4
ADDRLP4 344
INDIRI4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $3187
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
ADDRLP4 344
INDIRI4
SUBI4
GEI4 $3187
line 5115
;5115:    {
line 5116
;5116:      outputBuffer[outNum++] = *input++;
ADDRLP4 348
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 356
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 348
INDIRI4
ADDRLP4 356
INDIRI4
ADDI4
ASGNI4
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 352
INDIRP4
ADDRLP4 356
INDIRI4
ADDP4
ASGNP4
ADDRLP4 348
INDIRI4
ADDRLP4 328
INDIRP4
ADDP4
ADDRLP4 352
INDIRP4
INDIRI1
ASGNI1
line 5117
;5117:      outputBuffer[outNum++] = *input++;
ADDRLP4 360
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 368
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 360
INDIRI4
ADDRLP4 368
INDIRI4
ADDI4
ASGNI4
ADDRLP4 364
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 364
INDIRP4
ADDRLP4 368
INDIRI4
ADDP4
ASGNP4
ADDRLP4 360
INDIRI4
ADDRLP4 328
INDIRP4
ADDP4
ADDRLP4 364
INDIRP4
INDIRI1
ASGNI1
line 5118
;5118:    }
ADDRGP4 $3188
JUMPV
LABELV $3187
line 5119
;5119:    else if (*input == '$')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 36
NEI4 $3189
line 5120
;5120:    {
line 5121
;5121:      doneAnything = qtrue;
ADDRLP4 332
CNSTI4 1
ASGNI4
line 5122
;5122:      input++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 5123
;5123:      if (*input == '{')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $3191
line 5124
;5124:        input++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $3191
line 5125
;5125:      for(i = 0;*input && (isalnum(*input) || *input == '_') && i < 63;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3196
JUMPV
LABELV $3193
line 5126
;5126:        cvarName[i] = *input++;
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 348
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 0
INDIRI4
ADDRLP4 264
ADDP4
ADDRLP4 348
INDIRP4
INDIRI1
ASGNI1
LABELV $3194
line 5125
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3196
ADDRLP4 352
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 0
EQI4 $3198
ADDRLP4 352
INDIRI4
CNSTI4 65
LTI4 $3200
ADDRLP4 352
INDIRI4
CNSTI4 90
LEI4 $3199
LABELV $3200
ADDRLP4 356
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 97
LTI4 $3201
ADDRLP4 356
INDIRI4
CNSTI4 122
LEI4 $3199
LABELV $3201
ADDRLP4 360
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 48
LTI4 $3202
ADDRLP4 360
INDIRI4
CNSTI4 57
LEI4 $3199
LABELV $3202
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 95
NEI4 $3198
LABELV $3199
ADDRLP4 0
INDIRI4
CNSTI4 63
LTI4 $3193
LABELV $3198
line 5127
;5127:      cvarName[i] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 264
ADDP4
CNSTI1 0
ASGNI1
line 5128
;5128:      if (*input == '}')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $3203
line 5129
;5129:        input++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $3203
line 5130
;5130:      trap_Cvar_VariableStringBuffer(cvarName, cvarValue, sizeof(cvarValue));
ADDRLP4 264
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 5131
;5131:      if (cvarValue[0])
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $3190
line 5132
;5132:      {
line 5133
;5133:        for(i = 0;cvarValue[i] && outNum < len;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3210
JUMPV
LABELV $3207
line 5134
;5134:          outputBuffer[outNum++] = cvarValue[i];
ADDRLP4 364
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 364
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 364
INDIRI4
ADDRLP4 328
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
INDIRI1
ASGNI1
LABELV $3208
line 5133
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3210
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $3211
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $3207
LABELV $3211
line 5135
;5135:      }
line 5136
;5136:    }
ADDRGP4 $3190
JUMPV
LABELV $3189
line 5138
;5137:    else
;5138:      outputBuffer[outNum++] = *input++;
ADDRLP4 348
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 356
CNSTI4 1
ASGNI4
ADDRLP4 4
ADDRLP4 348
INDIRI4
ADDRLP4 356
INDIRI4
ADDI4
ASGNI4
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 352
INDIRP4
ADDRLP4 356
INDIRI4
ADDP4
ASGNP4
ADDRLP4 348
INDIRI4
ADDRLP4 328
INDIRP4
ADDP4
ADDRLP4 352
INDIRP4
INDIRI1
ASGNI1
LABELV $3190
LABELV $3188
line 5139
;5139:  }
LABELV $3185
line 5112
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $3212
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $3184
LABELV $3212
line 5140
;5140:  outputBuffer[outNum] = '\0';
ADDRLP4 4
INDIRI4
ADDRLP4 328
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 5141
;5141:  Q_strncpyz(output, outputBuffer, len);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 328
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 5142
;5142:  G_Free(outputBuffer);
ADDRLP4 328
INDIRP4
ARGP4
ADDRGP4 G_Free
CALLV
pop
line 5143
;5143:  return doneAnything;
ADDRLP4 332
INDIRI4
RETI4
LABELV $3181
endproc G_StringReplaceCvars 372 12
export G_admin_print
proc G_admin_print 1032 8
line 5156
;5144:}
;5145:
;5146:/*
;5147: ================
;5148: G_admin_print
;5149:
;5150: This function facilitates the ADMP define.  ADMP() is similar to CP except
;5151: that it prints the message to the server console if ent is not defined.
;5152: ================
;5153: */
;5154:void
;5155:G_admin_print(gentity_t *ent, char *m)
;5156:{
line 5157
;5157:  if (ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3214
line 5158
;5158:    trap_SendServerCommand(ent - level.gentities, va("print \"%s\"", m));
ADDRGP4 $3217
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level+4
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
ADDRGP4 $3215
JUMPV
LABELV $3214
line 5160
;5159:  else
;5160:  {
line 5162
;5161:    char m2[MAX_STRING_CHARS];
;5162:    if (!trap_Cvar_VariableIntegerValue("com_ansiColor"))
ADDRGP4 $3220
ARGP4
ADDRLP4 1028
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $3218
line 5163
;5163:    {
line 5164
;5164:      G_DecolorString(m, m2);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_DecolorString
CALLV
pop
line 5165
;5165:      G_Printf(m2);
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 5166
;5166:    }
ADDRGP4 $3219
JUMPV
LABELV $3218
line 5168
;5167:    else
;5168:      G_Printf(m);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
LABELV $3219
line 5169
;5169:  }
LABELV $3215
line 5170
;5170:}
LABELV $3213
endproc G_admin_print 1032 8
export G_admin_buffer_begin
proc G_admin_buffer_begin 0 0
line 5174
;5171:
;5172:void
;5173:G_admin_buffer_begin()
;5174:{
line 5175
;5175:  g_bfb[0] = '\0';
ADDRGP4 g_bfb
CNSTI1 0
ASGNI1
line 5176
;5176:}
LABELV $3221
endproc G_admin_buffer_begin 0 0
export G_admin_buffer_end
proc G_admin_buffer_end 0 8
line 5180
;5177:
;5178:void
;5179:G_admin_buffer_end(gentity_t *ent)
;5180:{
line 5181
;5181:  ADMP(g_bfb);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 g_bfb
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5182
;5182:}
LABELV $3222
endproc G_admin_buffer_end 0 8
export G_admin_buffer_print
proc G_admin_buffer_print 8 12
line 5186
;5183:
;5184:void
;5185:G_admin_buffer_print(gentity_t *ent, char *m)
;5186:{
line 5188
;5187:  // 1022 - strlen("print 64 \"\"") - 1
;5188:  if (strlen(m) + strlen(g_bfb) >= 1009)
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 g_bfb
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
CNSTI4 1009
LTI4 $3224
line 5189
;5189:  {
line 5190
;5190:    ADMP(g_bfb);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 g_bfb
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5191
;5191:    g_bfb[0] = '\0';
ADDRGP4 g_bfb
CNSTI1 0
ASGNI1
line 5192
;5192:  }
LABELV $3224
line 5193
;5193:  Q_strcat(g_bfb, sizeof(g_bfb), m);
ADDRGP4 g_bfb
ARGP4
CNSTI4 32000
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 5194
;5194:}
LABELV $3223
endproc G_admin_buffer_print 8 12
export G_admin_cleanup
proc G_admin_cleanup 20 4
line 5198
;5195:
;5196:void
;5197:G_admin_cleanup()
;5198:{
line 5199
;5199:  int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5201
;5200:
;5201:  for(i = 0;i < MAX_ADMIN_LEVELS && g_admin_levels[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3230
JUMPV
LABELV $3227
line 5202
;5202:  {
line 5203
;5203:    G_Free(g_admin_levels[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Free
CALLV
pop
line 5204
;5204:    g_admin_levels[i] = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
CNSTP4 0
ASGNP4
line 5205
;5205:  }
LABELV $3228
line 5201
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3230
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $3231
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_levels
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3227
LABELV $3231
line 5206
;5206:  for(i = 0;i < MAX_ADMIN_ADMINS && g_admin_admins[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3235
JUMPV
LABELV $3232
line 5207
;5207:  {
line 5208
;5208:    G_Free(g_admin_admins[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Free
CALLV
pop
line 5209
;5209:    g_admin_admins[i] = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
CNSTP4 0
ASGNP4
line 5210
;5210:  }
LABELV $3233
line 5206
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3235
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $3236
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3232
LABELV $3236
line 5211
;5211:  for(i = 0;i < MAX_ADMIN_BANS && g_admin_bans[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3240
JUMPV
LABELV $3237
line 5212
;5212:  {
line 5213
;5213:    G_Free(g_admin_bans[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Free
CALLV
pop
line 5214
;5214:    g_admin_bans[i] = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
CNSTP4 0
ASGNP4
line 5215
;5215:  }
LABELV $3238
line 5211
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3240
ADDRLP4 0
INDIRI4
CNSTI4 1024
GEI4 $3241
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_bans
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3237
LABELV $3241
line 5216
;5216:  for(i = 0;i < MAX_ADMIN_COMMANDS && g_admin_commands[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3245
JUMPV
LABELV $3242
line 5217
;5217:  {
line 5218
;5218:    G_Free(g_admin_commands[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Free
CALLV
pop
line 5219
;5219:    g_admin_commands[i] = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
CNSTP4 0
ASGNP4
line 5220
;5220:  }
LABELV $3243
line 5216
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3245
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $3246
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_commands
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3242
LABELV $3246
line 5221
;5221:}
LABELV $3226
endproc G_admin_cleanup 20 4
lit
align 1
LABELV $3248
byte 1 0
skip 31
align 1
LABELV $3249
byte 1 0
skip 31
export G_admin_L0
code
proc G_admin_L0 1388 12
line 5225
;5222:
;5223:qboolean
;5224:G_admin_L0(gentity_t *ent, int skiparg)
;5225:{
line 5228
;5226:  int pids[MAX_CLIENTS];
;5227:  char name[MAX_NAME_LENGTH] =
;5228:  { "" };
ADDRLP4 4
ADDRGP4 $3248
INDIRB
ASGNB 32
line 5230
;5229:  char testname[MAX_NAME_LENGTH] =
;5230:  { "" };
ADDRLP4 44
ADDRGP4 $3249
INDIRB
ASGNB 32
line 5232
;5231:  char err[MAX_STRING_CHARS];
;5232:  qboolean numeric = qtrue;
ADDRLP4 40
CNSTI4 1
ASGNI4
line 5234
;5233:  int i;
;5234:  int id = -1;
ADDRLP4 36
CNSTI4 -1
ASGNI4
line 5237
;5235:  gentity_t *vic;
;5236:
;5237:  if (G_SayArgc() < 2 + skiparg)
ADDRLP4 1360
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 1360
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
GEI4 $3250
line 5238
;5238:  {
line 5239
;5239:    ADMP("^3!L0: ^7usage: !L0 [name|slot#|admin#]\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3252
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5240
;5240:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3247
JUMPV
LABELV $3250
line 5242
;5241:  }
;5242:  G_SayArgv(1 + skiparg, testname, sizeof(testname));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 44
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 5243
;5243:  G_SanitiseString(testname, name, sizeof(name));
ADDRLP4 44
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 5244
;5244:  for(i = 0;i < sizeof(name) && name[i];i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3256
JUMPV
LABELV $3253
line 5245
;5245:  {
line 5246
;5246:    if (name[i] < '0' || name[i] > '9')
ADDRLP4 1364
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1364
INDIRI4
CNSTI4 48
LTI4 $3259
ADDRLP4 1364
INDIRI4
CNSTI4 57
LEI4 $3257
LABELV $3259
line 5247
;5247:    {
line 5248
;5248:      numeric = qfalse;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 5249
;5249:      break;
ADDRGP4 $3255
JUMPV
LABELV $3257
line 5251
;5250:    }
;5251:  }
LABELV $3254
line 5244
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3256
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 32
GEU4 $3260
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3253
LABELV $3260
LABELV $3255
line 5253
;5252:
;5253:  if (numeric)
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $3261
line 5254
;5254:  {
line 5255
;5255:    id = atoi(name);
ADDRLP4 4
ARGP4
ADDRLP4 1368
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 1368
INDIRI4
ASGNI4
line 5256
;5256:  }
ADDRGP4 $3262
JUMPV
LABELV $3261
line 5258
;5257:  else
;5258:  {
line 5259
;5259:    if (G_ClientNumbersFromString(name, pids) != 1)
ADDRLP4 4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 1368
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 1368
INDIRI4
CNSTI4 1
EQI4 $3263
line 5260
;5260:    {
line 5261
;5261:      G_MatchOnePlayer(pids, err, sizeof(err));
ADDRLP4 80
ARGP4
ADDRLP4 336
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLI4
pop
line 5262
;5262:      ADMP(va("^3!L0: ^7%s\n", err));
ADDRGP4 $3265
ARGP4
ADDRLP4 336
ARGP4
ADDRLP4 1372
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1372
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5263
;5263:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3247
JUMPV
LABELV $3263
line 5265
;5264:    }
;5265:    id = pids[0];
ADDRLP4 36
ADDRLP4 80
INDIRI4
ASGNI4
line 5266
;5266:  }
LABELV $3262
line 5268
;5267:
;5268:  if (id >= 0 && id < level.maxclients)
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $3266
ADDRLP4 36
INDIRI4
ADDRGP4 level+20
INDIRI4
GEI4 $3266
line 5269
;5269:  {
line 5270
;5270:    vic = &g_entities[id];
ADDRLP4 76
CNSTI4 2476
ADDRLP4 36
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 5271
;5271:    if (!vic || !(vic->client) || vic->client->pers.connected != CON_CONNECTED)
ADDRLP4 1372
ADDRLP4 76
INDIRP4
ASGNP4
ADDRLP4 1376
CNSTU4 0
ASGNU4
ADDRLP4 1372
INDIRP4
CVPU4 4
ADDRLP4 1376
INDIRU4
EQU4 $3272
ADDRLP4 1380
ADDRLP4 1372
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1380
INDIRP4
CVPU4 4
ADDRLP4 1376
INDIRU4
EQU4 $3272
ADDRLP4 1380
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
EQI4 $3269
LABELV $3272
line 5272
;5272:    {
line 5273
;5273:      ADMP("^3!L0:^7 no one connected by that slot number\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3273
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5274
;5274:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3247
JUMPV
LABELV $3269
line 5277
;5275:    }
;5276:
;5277:    if (G_admin_level(vic) != 1)
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 1384
ADDRGP4 G_admin_level
CALLI4
ASGNI4
ADDRLP4 1384
INDIRI4
CNSTI4 1
EQI4 $3267
line 5278
;5278:    {
line 5279
;5279:      ADMP("^3!L0:^7 intended victim is not level 1\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3276
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5280
;5280:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3247
JUMPV
line 5282
;5281:    }
;5282:  }
LABELV $3266
line 5283
;5283:  else if (id >= MAX_CLIENTS && id < MAX_CLIENTS + MAX_ADMIN_ADMINS && g_admin_admins[id - MAX_CLIENTS])
ADDRLP4 36
INDIRI4
CNSTI4 64
LTI4 $3277
ADDRLP4 36
INDIRI4
CNSTI4 1088
GEI4 $3277
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins-256
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3277
line 5284
;5284:  {
line 5285
;5285:    if (g_admin_admins[id - MAX_CLIENTS]->level != 1)
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_admins-256
ADDP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
EQI4 $3278
line 5286
;5286:    {
line 5287
;5287:      ADMP("^3!L0:^7 intended victim is not level 1\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3276
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5288
;5288:      return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3247
JUMPV
line 5290
;5289:    }
;5290:  }
LABELV $3277
line 5292
;5291:  else
;5292:  {
line 5293
;5293:    ADMP("^3!L0:^7 no match.  use !listplayers or !listadmins to "
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3283
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5295
;5294:        "find an appropriate number to use instead of name.\n");
;5295:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3247
JUMPV
LABELV $3278
LABELV $3267
line 5298
;5296:  }
;5297:
;5298:  trap_SendConsoleCommand(EXEC_APPEND, va("!setlevel %d 0;", id));
ADDRGP4 $3284
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 1376
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1376
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 5300
;5299:
;5300:  return qtrue;
CNSTI4 1
RETI4
LABELV $3247
endproc G_admin_L0 1388 12
export G_admin_L1
proc G_admin_L1 1340 12
line 5305
;5301:}
;5302:
;5303:qboolean
;5304:G_admin_L1(gentity_t *ent, int skiparg)
;5305:{
line 5310
;5306:  int pids[MAX_CLIENTS];
;5307:  char name[MAX_NAME_LENGTH], *reason, err[MAX_STRING_CHARS];
;5308:  int minargc;
;5309:
;5310:  minargc = 2 + skiparg;
ADDRLP4 288
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 5312
;5311:
;5312:  if (G_SayArgc() < minargc)
ADDRLP4 1320
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 1320
INDIRI4
ADDRLP4 288
INDIRI4
GEI4 $3286
line 5313
;5313:  {
line 5314
;5314:    ADMP("^3!L1: ^7usage: !L1 [name]\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3288
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5315
;5315:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3285
JUMPV
LABELV $3286
line 5317
;5316:  }
;5317:  G_SayArgv(1 + skiparg, name, sizeof(name));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 5318
;5318:  reason = G_SayConcatArgs(2 + skiparg);
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 1324
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 1316
ADDRLP4 1324
INDIRP4
ASGNP4
line 5319
;5319:  if (G_ClientNumbersFromString(name, pids) != 1)
ADDRLP4 256
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1328
ADDRGP4 G_ClientNumbersFromString
CALLI4
ASGNI4
ADDRLP4 1328
INDIRI4
CNSTI4 1
EQI4 $3289
line 5320
;5320:  {
line 5321
;5321:    G_MatchOnePlayer(pids, err, sizeof(err));
ADDRLP4 0
ARGP4
ADDRLP4 292
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_MatchOnePlayer
CALLI4
pop
line 5322
;5322:    ADMP(va("^3!L1: ^7%s\n", err));
ADDRGP4 $3291
ARGP4
ADDRLP4 292
ARGP4
ADDRLP4 1332
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1332
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5323
;5323:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3285
JUMPV
LABELV $3289
line 5325
;5324:  }
;5325:  if (G_admin_level(&g_entities[pids[0]]) > 0)
CNSTI4 2476
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1332
ADDRGP4 G_admin_level
CALLI4
ASGNI4
ADDRLP4 1332
INDIRI4
CNSTI4 0
LEI4 $3292
line 5326
;5326:  {
line 5327
;5327:    ADMP("^3!L1: ^7Sorry, but that person is already higher than level 0.\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3294
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5328
;5328:    return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3285
JUMPV
LABELV $3292
line 5331
;5329:  }
;5330:
;5331:  trap_SendConsoleCommand(EXEC_APPEND, va("!setlevel %d 1;", pids[0]));
ADDRGP4 $3295
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1336
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1336
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 5332
;5332:  return qtrue;
CNSTI4 1
RETI4
LABELV $3285
endproc G_admin_L1 1340 12
export G_matchName
proc G_matchName 56 12
line 5337
;5333:}
;5334:
;5335://g_global.c
;5336:int G_matchName(char *who)
;5337:{
line 5338
;5338:	int i = 0,j = 0, logmatch = 0, logmatches = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 44
CNSTI4 0
ASGNI4
line 5341
;5339:	char n2[MAX_NAME_LENGTH];
;5340:
;5341:	for (i = 0;i < MAX_ADMIN_NAMELOGS && g_admin_namelog[i]; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3300
JUMPV
LABELV $3297
line 5342
;5342:		{
line 5344
;5343:			// skip players in the namelog who have already been banned
;5344:			if (g_admin_namelog[i]->banned)
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
EQI4 $3301
line 5345
;5345:				continue;
ADDRGP4 $3298
JUMPV
LABELV $3301
line 5347
;5346:
;5347:			for (j = 0; j < MAX_ADMIN_NAMELOG_NAMES
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3306
JUMPV
LABELV $3303
line 5349
;5348:					&& g_admin_namelog[i]->name[j][0]; j++)
;5349:			{
line 5350
;5350:				G_SanitiseString(g_admin_namelog[i]->name[j], n2, sizeof(n2));
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 5351
;5351:				if (strstr(n2, who))
ADDRLP4 8
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3307
line 5352
;5352:				{
line 5353
;5353:					if (logmatch != i)
ADDRLP4 40
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $3309
line 5354
;5354:						logmatches++;
ADDRLP4 44
ADDRLP4 44
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3309
line 5355
;5355:					logmatch = i;
ADDRLP4 40
ADDRLP4 4
INDIRI4
ASGNI4
line 5356
;5356:				}
LABELV $3307
line 5357
;5357:			}
LABELV $3304
line 5348
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3306
line 5347
ADDRLP4 52
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 52
INDIRI4
GEI4 $3311
ADDRLP4 0
INDIRI4
ADDRLP4 52
INDIRI4
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3303
LABELV $3311
line 5358
;5358:		}
LABELV $3298
line 5341
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3300
ADDRLP4 4
INDIRI4
CNSTI4 128
GEI4 $3312
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_admin_namelog
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3297
LABELV $3312
line 5359
;5359:	if(logmatches > 1 || logmatches == 0)
ADDRLP4 44
INDIRI4
CNSTI4 1
GTI4 $3315
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $3313
LABELV $3315
line 5360
;5360:	{
line 5361
;5361:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $3296
JUMPV
LABELV $3313
line 5363
;5362:	}
;5363:	return logmatch;
ADDRLP4 40
INDIRI4
RETI4
LABELV $3296
endproc G_matchName 56 12
export G_isValidIpAddress
proc G_isValidIpAddress 16 0
line 5366
;5364:}
;5365:qboolean G_isValidIpAddress(char *ip)
;5366:{
line 5367
;5367:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 5368
;5368:	int countChars = 0, countPoints = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
line 5370
;5369:
;5370:	for (i = 0; ip[i] != '\0'; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3320
JUMPV
LABELV $3317
line 5371
;5371:	{
line 5372
;5372:		countChars++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5373
;5373:		if (ip[i] == '.')
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $3321
line 5374
;5374:		{
line 5375
;5375:			countPoints++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5376
;5376:			continue;
LABELV $3321
line 5378
;5377:		}
;5378:	}
LABELV $3318
line 5370
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3320
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3317
line 5379
;5379:	if(countPoints == 3 && (countChars >= 7) && (countChars <= 15))
ADDRLP4 8
INDIRI4
CNSTI4 3
NEI4 $3323
ADDRLP4 4
INDIRI4
CNSTI4 7
LTI4 $3323
ADDRLP4 4
INDIRI4
CNSTI4 15
GTI4 $3323
line 5380
;5380:	{
line 5381
;5381:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3316
JUMPV
LABELV $3323
line 5383
;5382:	}
;5383:	return qfalse;
CNSTI4 0
RETI4
LABELV $3316
endproc G_isValidIpAddress 16 0
export G_adminDeleteGlobal
proc G_adminDeleteGlobal 1048 12
line 5386
;5384:}
;5385:qboolean G_adminDeleteGlobal(gentity_t *ent, int skiparg)
;5386:{
line 5388
;5387:	char param1[MAX_STRING_CHARS];
;5388:	int minArguments = 1 + skiparg;
ADDRLP4 1028
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5391
;5389:	int id;
;5390:
;5391:	if (G_SayArgc() < minArguments)
ADDRLP4 1032
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
ADDRLP4 1028
INDIRI4
GEI4 $3326
line 5392
;5392:	{
line 5393
;5393:		ADMP( "^3!help: ^7!gdelete\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3328
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5394
;5394:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3325
JUMPV
LABELV $3326
line 5397
;5395:	}
;5396:
;5397:	G_SayArgv(1 + skiparg, param1, sizeof(param1));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 5398
;5398:	id = atoi(param1);
ADDRLP4 0
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1036
INDIRI4
ASGNI4
line 5400
;5399:
;5400:	if(id > 0)
ADDRLP4 1024
INDIRI4
CNSTI4 0
LEI4 $3329
line 5401
;5401:	{
line 5402
;5402:		if(G_deleteGlobal(id))
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1040
ADDRGP4 G_deleteGlobal
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $3331
line 5403
;5403:		{
line 5404
;5404:			ADMP( va("^3!gdelete: ^7global %d deleted\n", id) );
ADDRGP4 $3333
ARGP4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5405
;5405:		}
ADDRGP4 $3332
JUMPV
LABELV $3331
line 5407
;5406:		else
;5407:		{
line 5408
;5408:			ADMP( va("^3!gdelete: ^7global %d not found\n", id) );
ADDRGP4 $3334
ARGP4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5409
;5409:		}
LABELV $3332
line 5410
;5410:	}
LABELV $3329
line 5412
;5411:
;5412:	return qtrue;
CNSTI4 1
RETI4
LABELV $3325
endproc G_adminDeleteGlobal 1048 12
export G_getLongerGlobalName
proc G_getLongerGlobalName 16 4
line 5415
;5413:}
;5414:int G_getLongerGlobalName(void)
;5415:{
line 5416
;5416:	global_t *global = level.globals;
ADDRLP4 0
ADDRGP4 level+190020
INDIRP4
ASGNP4
line 5417
;5417:	int max_name = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $3338
JUMPV
LABELV $3337
line 5419
;5418:	while (global)
;5419:	{
line 5420
;5420:		if (strlen(global->playerName) > max_name)
ADDRLP4 0
INDIRP4
CNSTI4 1077
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $3340
line 5421
;5421:		{
line 5422
;5422:			max_name = strlen(global->playerName);
ADDRLP4 0
INDIRP4
CNSTI4 1077
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 5423
;5423:		}
LABELV $3340
line 5424
;5424:		global = global->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1172
ADDP4
INDIRP4
ASGNP4
line 5425
;5425:	}
LABELV $3338
line 5418
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3337
line 5426
;5426:	return max_name;
ADDRLP4 4
INDIRI4
RETI4
LABELV $3335
endproc G_getLongerGlobalName 16 4
export G_getLongerWhiteName
proc G_getLongerWhiteName 16 4
line 5429
;5427:}
;5428:int G_getLongerWhiteName()
;5429:{
line 5430
;5430:	whitelist_t *white = level.whitelist;
ADDRLP4 0
ADDRGP4 level+190024
INDIRP4
ASGNP4
line 5431
;5431:	int max_name = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $3345
JUMPV
LABELV $3344
line 5433
;5432:	while (white)
;5433:	{
line 5434
;5434:		if (strlen(white->playerName) > max_name)
ADDRLP4 0
INDIRP4
CNSTI4 1077
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $3347
line 5435
;5435:		{
line 5436
;5436:			max_name = strlen(white->playerName);
ADDRLP4 0
INDIRP4
CNSTI4 1077
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 5437
;5437:		}
LABELV $3347
line 5438
;5438:		white = white->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1152
ADDP4
INDIRP4
ASGNP4
line 5439
;5439:	}
LABELV $3345
line 5432
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3344
line 5440
;5440:	return max_name;
ADDRLP4 4
INDIRI4
RETI4
LABELV $3342
endproc G_getLongerWhiteName 16 4
lit
align 1
LABELV $3350
byte 1 0
skip 15
export G_printIp
code
proc G_printIp 36 8
line 5443
;5441:}
;5442:char *G_printIp(char *ip, int subnet)
;5443:{
line 5445
;5444:	int i;
;5445:	int octet=0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 5446
;5446:	char newIp[16] = "";
ADDRLP4 4
ADDRGP4 $3350
INDIRB
ASGNB 16
line 5447
;5447:	for(i=0;ip[i] != '\0';i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $3354
JUMPV
LABELV $3351
line 5448
;5448:	{
line 5449
;5449:		if(ip[i] == '.')
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $3355
line 5450
;5450:			octet++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3355
line 5452
;5451:
;5452:		if(subnet == 1 && octet > 1 && ip[i] != '.')
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $3357
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $3357
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 46
EQI4 $3357
line 5453
;5453:		{
line 5454
;5454:			if(newIp[i-1] == '*')
ADDRLP4 0
INDIRI4
ADDRLP4 4-1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $3359
line 5455
;5455:				continue;
ADDRGP4 $3352
JUMPV
LABELV $3359
line 5456
;5456:			newIp[i] = '*';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 42
ASGNI1
line 5457
;5457:			continue;
ADDRGP4 $3352
JUMPV
LABELV $3357
line 5459
;5458:		}
;5459:		if(subnet == 2 && octet > 2 && ip[i] != '.')
ADDRLP4 28
CNSTI4 2
ASGNI4
ADDRFP4 4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $3362
ADDRLP4 20
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $3362
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 46
EQI4 $3362
line 5460
;5460:		{
line 5461
;5461:			if(newIp[i-1] == '*')
ADDRLP4 0
INDIRI4
ADDRLP4 4-1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $3364
line 5462
;5462:				continue;
ADDRGP4 $3352
JUMPV
LABELV $3364
line 5463
;5463:			newIp[i] = '*';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 42
ASGNI1
line 5464
;5464:			continue;
ADDRGP4 $3352
JUMPV
LABELV $3362
line 5467
;5465:		}
;5466:
;5467:		newIp[i] = ip[i];
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 5468
;5468:	}
LABELV $3352
line 5447
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3354
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3351
line 5469
;5469:	return va("%s",newIp);
ADDRGP4 $406
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
RETP4
LABELV $3349
endproc G_printIp 36 8
lit
align 1
LABELV $3369
byte 1 0
skip 63
align 1
LABELV $3370
byte 1 37
byte 1 115
byte 1 0
skip 29
export G_adminListGlobals
code
proc G_adminListGlobals 1200 32
line 5472
;5470:}
;5471:qboolean G_adminListGlobals(gentity_t *ent, int skiparg)
;5472:{
line 5473
;5473:	global_t *global = level.globals;
ADDRLP4 0
ADDRGP4 level+190020
INDIRP4
ASGNP4
line 5476
;5474:	char *type;
;5475:	char nameFixed[MAX_NAME_LENGTH * 2] =
;5476:	{ "" };
ADDRLP4 1032
ADDRGP4 $3369
INDIRB
ASGNB 64
line 5478
;5477:	char name_fmt[32] =
;5478:	{ "%s" };
ADDRLP4 1100
ADDRGP4 $3370
INDIRB
ASGNB 32
line 5479
;5479:	int max_name = 1;
ADDRLP4 1144
CNSTI4 1
ASGNI4
line 5480
;5480:	int listOffset = 0;
ADDRLP4 1096
CNSTI4 0
ASGNI4
line 5481
;5481:	qboolean searchByIp = qfalse;
ADDRLP4 1132
CNSTI4 0
ASGNI4
line 5482
;5482:	int i=0,j=0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 1148
CNSTI4 0
ASGNI4
line 5483
;5483:	int globalCount = 0;
ADDRLP4 1136
CNSTI4 0
ASGNI4
line 5488
;5484:
;5485:	char param1[MAX_STRING_CHARS];
;5486:
;5487:	//Check if listing by offset
;5488:	G_SayArgv(1 + skiparg, param1, sizeof(param1));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 5490
;5489:
;5490:	if( strchr( param1, '.' ) != NULL )
ADDRLP4 8
ARGP4
CNSTI4 46
ARGI4
ADDRLP4 1152
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 1152
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $3371
line 5491
;5491:	{
line 5492
;5492:		searchByIp = qtrue;
ADDRLP4 1132
CNSTI4 1
ASGNI4
line 5493
;5493:	}
ADDRGP4 $3372
JUMPV
LABELV $3371
line 5495
;5494:	else
;5495:	{
line 5496
;5496:		listOffset = atoi(param1);
ADDRLP4 8
ARGP4
ADDRLP4 1156
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1096
ADDRLP4 1156
INDIRI4
ASGNI4
line 5497
;5497:	}
LABELV $3372
line 5499
;5498:
;5499:	max_name = G_getLongerGlobalName();
ADDRLP4 1156
ADDRGP4 G_getLongerGlobalName
CALLI4
ASGNI4
ADDRLP4 1144
ADDRLP4 1156
INDIRI4
ASGNI4
line 5500
;5500:	ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 5502
;5501:
;5502:	if(searchByIp)
ADDRLP4 1132
INDIRI4
CNSTI4 0
EQI4 $3373
line 5503
;5503:	{
line 5504
;5504:		ADMBP(va("^3Listing ips matching %s\n", param1));
ADDRGP4 $3375
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1160
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5505
;5505:	}
ADDRGP4 $3381
JUMPV
LABELV $3373
line 5507
;5506:	else
;5507:	{
line 5508
;5508:		if(listOffset == 0)
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $3376
line 5509
;5509:		{
line 5510
;5510:			ADMBP(va("^3Listing the last 10 globals\n"));
ADDRGP4 $3378
ARGP4
ADDRLP4 1160
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5511
;5511:		}
ADDRGP4 $3381
JUMPV
LABELV $3376
line 5513
;5512:		else
;5513:		{
line 5514
;5514:			ADMBP(va("^3List from %d to %d\n", listOffset, listOffset+10));
ADDRGP4 $3379
ARGP4
ADDRLP4 1096
INDIRI4
ARGI4
ADDRLP4 1096
INDIRI4
CNSTI4 10
ADDI4
ARGI4
ADDRLP4 1164
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5515
;5515:		}
line 5516
;5516:	}
ADDRGP4 $3381
JUMPV
LABELV $3380
line 5519
;5517:
;5518:	while (global)
;5519:	{
line 5520
;5520:		if(!searchByIp && listOffset && (global->id < listOffset || global->id > (listOffset + 10)))
ADDRLP4 1160
CNSTI4 0
ASGNI4
ADDRLP4 1132
INDIRI4
ADDRLP4 1160
INDIRI4
NEI4 $3383
ADDRLP4 1096
INDIRI4
ADDRLP4 1160
INDIRI4
EQI4 $3383
ADDRLP4 1168
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 1168
INDIRI4
ADDRLP4 1096
INDIRI4
LTI4 $3385
ADDRLP4 1168
INDIRI4
ADDRLP4 1096
INDIRI4
CNSTI4 10
ADDI4
LEI4 $3383
LABELV $3385
line 5521
;5521:		{
line 5522
;5522:			global = global->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1172
ADDP4
INDIRP4
ASGNP4
line 5523
;5523:			continue;
ADDRGP4 $3381
JUMPV
LABELV $3383
line 5525
;5524:		}
;5525:		if(searchByIp)
ADDRLP4 1132
INDIRI4
CNSTI4 0
EQI4 $3386
line 5526
;5526:		{
line 5527
;5527:			qboolean notMatch = qfalse;
ADDRLP4 1172
CNSTI4 0
ASGNI4
line 5528
;5528:			for(i=0;param1[i] != '\0';i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $3391
JUMPV
LABELV $3388
line 5529
;5529:			{
line 5530
;5530:				if(param1[i] != global->ip[i])
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 37
ADDP4
ADDP4
INDIRI1
CVII4 1
EQI4 $3392
line 5531
;5531:				{
line 5532
;5532:					notMatch = qtrue;
ADDRLP4 1172
CNSTI4 1
ASGNI4
line 5533
;5533:				}
LABELV $3392
line 5534
;5534:			}
LABELV $3389
line 5528
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $3391
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $3388
line 5535
;5535:			if(notMatch)
ADDRLP4 1172
INDIRI4
CNSTI4 0
EQI4 $3394
line 5536
;5536:			{
line 5537
;5537:				global = global->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1172
ADDP4
INDIRP4
ASGNP4
line 5538
;5538:				continue;
ADDRGP4 $3381
JUMPV
LABELV $3394
line 5540
;5539:			}
;5540:		}
LABELV $3386
line 5542
;5541:
;5542:		if(globalCount >= 10)
ADDRLP4 1136
INDIRI4
CNSTI4 10
LTI4 $3396
line 5543
;5543:			break;
ADDRGP4 $3382
JUMPV
LABELV $3396
line 5544
;5544:		globalCount++;
ADDRLP4 1136
ADDRLP4 1136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5546
;5545:
;5546:		G_DecolorString(global->playerName, nameFixed);
ADDRLP4 0
INDIRP4
CNSTI4 1077
ADDP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 G_DecolorString
CALLV
pop
line 5547
;5547:		Com_sprintf(name_fmt, sizeof(name_fmt), "%%%is", (max_name + strlen(global->playerName) - strlen(nameFixed)));
ADDRLP4 0
INDIRP4
CNSTI4 1077
ADDP4
ARGP4
ADDRLP4 1172
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1032
ARGP4
ADDRLP4 1176
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1100
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $667
ARGP4
ADDRLP4 1144
INDIRI4
ADDRLP4 1172
INDIRI4
ADDI4
ADDRLP4 1176
INDIRI4
SUBI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5548
;5548:		Com_sprintf(nameFixed, sizeof(nameFixed), name_fmt, global->playerName);
ADDRLP4 1032
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 1100
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1077
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5549
;5549:		type = getGlobalTypeString(global->type);
ADDRLP4 0
INDIRP4
CNSTI4 1164
ADDP4
INDIRI4
ARGI4
ADDRLP4 1180
ADDRGP4 getGlobalTypeString
CALLP4
ASGNP4
ADDRLP4 1140
ADDRLP4 1180
INDIRP4
ASGNP4
line 5550
;5550:		ADMBP( va( "^7%4i %s^7 %18s %10s\n    ^3\\__ %s ^7by %s ^7on %s\n",
ADDRLP4 0
INDIRP4
CNSTI4 37
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1160
ADDP4
INDIRI4
ARGI4
ADDRLP4 1188
ADDRGP4 G_printIp
CALLP4
ASGNP4
ADDRGP4 $3398
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1032
ARGP4
ADDRLP4 1188
INDIRP4
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 53
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1113
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1168
ADDP4
ARGP4
ADDRLP4 1196
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5559
;5551:						global->id,
;5552:						nameFixed,
;5553:						G_printIp(global->ip,global->subnet),
;5554:						//va("%s%s",global->ip,(global->subnet == 1) ? "/16" : (global->subnet == 2) ? "/24" : ""), //mindfuck,
;5555:						type,
;5556:						global->reason, global->adminName,
;5557:						global->server ) );
;5558:
;5559:		global = global->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1172
ADDP4
INDIRP4
ASGNP4
line 5560
;5560:	}
LABELV $3381
line 5518
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3380
LABELV $3382
line 5561
;5561:	ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 5562
;5562:	return qtrue;
CNSTI4 1
RETI4
LABELV $3367
endproc G_adminListGlobals 1200 32
export G_adminGlobalMute
proc G_adminGlobalMute 4 12
line 5565
;5563:}
;5564:qboolean G_adminGlobalMute(gentity_t *ent, int skiparg)
;5565:{
line 5566
;5566:	return G_adminGlobal(ent, skiparg, GLOBAL_MUTE);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 G_adminGlobal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $3399
endproc G_adminGlobalMute 4 12
export G_adminGlobalForcespec
proc G_adminGlobalForcespec 4 12
line 5569
;5567:}
;5568:qboolean G_adminGlobalForcespec(gentity_t *ent, int skiparg)
;5569:{
line 5570
;5570:	return G_adminGlobal(ent, skiparg, GLOBAL_FORCESPEC);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 0
ADDRGP4 G_adminGlobal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $3400
endproc G_adminGlobalForcespec 4 12
export G_adminGlobalDenyBuild
proc G_adminGlobalDenyBuild 4 12
line 5573
;5571:}
;5572:qboolean G_adminGlobalDenyBuild(gentity_t *ent, int skiparg)
;5573:{
line 5574
;5574:	return G_adminGlobal(ent, skiparg, GLOBAL_DENYBUILD);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 0
ADDRGP4 G_adminGlobal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $3401
endproc G_adminGlobalDenyBuild 4 12
export G_adminGlobalHandicap
proc G_adminGlobalHandicap 4 12
line 5577
;5575:}
;5576:qboolean G_adminGlobalHandicap(gentity_t *ent, int skiparg)
;5577:{
line 5578
;5578:	return G_adminGlobal(ent, skiparg, GLOBAL_HANDICAP);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
ADDRGP4 G_adminGlobal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $3402
endproc G_adminGlobalHandicap 4 12
export G_adminGlobalBan
proc G_adminGlobalBan 4 12
line 5581
;5579:}
;5580:qboolean G_adminGlobalBan(gentity_t *ent, int skiparg)
;5581:{
line 5582
;5582:	return G_adminGlobal(ent, skiparg, GLOBAL_BAN);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 0
ADDRGP4 G_adminGlobal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $3403
endproc G_adminGlobalBan 4 12
export G_adminGlobalSync
proc G_adminGlobalSync 4 8
line 5585
;5583:}
;5584:qboolean G_adminGlobalSync(gentity_t *ent, int skiparg)
;5585:{
line 5586
;5586:	ADMP( va("^3!gsync: ^7global entries fetched from database\n") );
ADDRGP4 $3405
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5587
;5587:	G_globalExit();
ADDRGP4 G_globalExit
CALLV
pop
line 5588
;5588:	G_globalInit();
ADDRGP4 G_globalInit
CALLV
pop
line 5589
;5589:	return qtrue;
CNSTI4 1
RETI4
LABELV $3404
endproc G_adminGlobalSync 4 8
export G_adminWhiteAdd
proc G_adminWhiteAdd 4 8
line 5592
;5590:}
;5591:qboolean G_adminWhiteAdd(gentity_t *ent, int skiparg)
;5592:{
line 5593
;5593:	return  G_adminWhitelistGlobal(ent, skiparg);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 G_adminWhitelistGlobal
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $3406
endproc G_adminWhiteAdd 4 8
lit
align 1
LABELV $3409
byte 1 0
skip 63
align 1
LABELV $3410
byte 1 37
byte 1 115
byte 1 0
skip 29
export G_adminWhiteList
code
proc G_adminWhiteList 140 28
line 5596
;5594:}
;5595:qboolean G_adminWhiteList(gentity_t *ent, int skiparg)
;5596:{
line 5597
;5597:	whitelist_t *white = level.whitelist;
ADDRLP4 4
ADDRGP4 level+190024
INDIRP4
ASGNP4
line 5599
;5598:	char nameFixed[MAX_NAME_LENGTH * 2] =
;5599:	{ "" };
ADDRLP4 17
ADDRGP4 $3409
INDIRB
ASGNB 64
line 5601
;5600:	char name_fmt[32] =
;5601:	{ "%s" };
ADDRLP4 81
ADDRGP4 $3410
INDIRB
ASGNB 32
line 5603
;5602:	char guid_stub[9];
;5603:	int max_name = 1;
ADDRLP4 116
CNSTI4 1
ASGNI4
line 5607
;5604:	int j;
;5605:
;5606:	//I need to check which name is the longer, to make it the width of the names column
;5607:	max_name = G_getLongerWhiteName();
ADDRLP4 120
ADDRGP4 G_getLongerWhiteName
CALLI4
ASGNI4
ADDRLP4 116
ADDRLP4 120
INDIRI4
ASGNI4
line 5609
;5608:
;5609:	ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
ADDRGP4 $3412
JUMPV
LABELV $3411
line 5611
;5610:	while (white)
;5611:	{
line 5612
;5612:		for( j = 0; j < 8; j++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $3414
line 5613
;5613:		{
line 5614
;5614:		      guid_stub[ j ] = white->guid[ j + 24 ];
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
INDIRI1
ASGNI1
line 5615
;5615:		}
LABELV $3415
line 5612
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $3414
line 5616
;5616:		guid_stub[ j ] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 5618
;5617:
;5618:		G_DecolorString(white->playerName, nameFixed);
ADDRLP4 4
INDIRP4
CNSTI4 1077
ADDP4
ARGP4
ADDRLP4 17
ARGP4
ADDRGP4 G_DecolorString
CALLV
pop
line 5619
;5619:		Com_sprintf(name_fmt, sizeof(name_fmt), "%%%is", (max_name
ADDRLP4 4
INDIRP4
CNSTI4 1077
ADDP4
ARGP4
ADDRLP4 124
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 17
ARGP4
ADDRLP4 128
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 81
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $667
ARGP4
ADDRLP4 116
INDIRI4
ADDRLP4 124
INDIRI4
ADDI4
ADDRLP4 128
INDIRI4
SUBI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 5621
;5620:				+ strlen(white->playerName) - strlen(nameFixed)));
;5621:		Com_sprintf(nameFixed, sizeof(nameFixed), name_fmt, white->playerName);
ADDRLP4 17
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 81
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1077
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 5623
;5622:
;5623:		ADMBP( va( "^7%4i %s^7 %18s %33s\n    ^3\\__ %s by %s\n",
ADDRGP4 $3418
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 17
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 37
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 53
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1113
ADDP4
ARGP4
ADDRLP4 136
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5630
;5624:				white->id,
;5625:						nameFixed,
;5626:						white->ip,
;5627:						guid_stub,
;5628:						white->reason, white->adminName ) );
;5629:
;5630:		white = white->next;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1152
ADDP4
INDIRP4
ASGNP4
line 5631
;5631:	}
LABELV $3412
line 5610
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $3411
line 5632
;5632:	ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 5633
;5633:	return qtrue;
CNSTI4 1
RETI4
LABELV $3407
endproc G_adminWhiteList 140 28
export G_adminWhiteDelete
proc G_adminWhiteDelete 1048 12
line 5636
;5634:}
;5635:qboolean G_adminWhiteDelete(gentity_t *ent, int skiparg)
;5636:{
line 5638
;5637:	char param1[MAX_STRING_CHARS];
;5638:	int minArguments = 1 + skiparg;
ADDRLP4 1028
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 5641
;5639:	int id;
;5640:	
;5641:	if (G_SayArgc() < minArguments)
ADDRLP4 1032
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
ADDRLP4 1028
INDIRI4
GEI4 $3420
line 5642
;5642:	{
line 5643
;5643:		ADMP( "^3!help: ^7!wdelete\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3422
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5644
;5644:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3419
JUMPV
LABELV $3420
line 5647
;5645:	}
;5646:	
;5647:	G_SayArgv(1 + skiparg, param1, sizeof(param1));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 5648
;5648:	id = atoi(param1);
ADDRLP4 0
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1036
INDIRI4
ASGNI4
line 5650
;5649:	
;5650:	if(id > 0)
ADDRLP4 1024
INDIRI4
CNSTI4 0
LEI4 $3423
line 5651
;5651:	{
line 5652
;5652:		if(G_deleteWhite(id))
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1040
ADDRGP4 G_deleteWhite
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $3425
line 5653
;5653:		{
line 5654
;5654:			ADMP( va("^3!wdelete: ^7white %d deleted\n", id) );
ADDRGP4 $3427
ARGP4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5655
;5655:		}
ADDRGP4 $3426
JUMPV
LABELV $3425
line 5657
;5656:		else
;5657:		{
line 5658
;5658:			ADMP( va("^3!wdelete: ^7white %d not found\n", id) );
ADDRGP4 $3428
ARGP4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5659
;5659:		}
LABELV $3426
line 5660
;5660:	}
LABELV $3423
line 5662
;5661:	
;5662:	return qtrue;
CNSTI4 1
RETI4
LABELV $3419
endproc G_adminWhiteDelete 1048 12
export G_badges
proc G_badges 8 12
line 5667
;5663:}
;5664://badges
;5665:
;5666:qboolean G_badges( gentity_t *ent, int skiparg )
;5667:{     
line 5668
;5668:	if(ent->client->pers.mysqlid == 1)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 1
NEI4 $3430
line 5669
;5669:	{
line 5670
;5670:		trap_SendServerCommand( ent-g_entities, va(
ADDRGP4 $3432
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 5672
;5671:												   "print \"^7In order to use badges you need a ^5updated ^7 client\n^2Download from: ^5http://blogwtf.com/backport\n\"" ) );
;5672:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3429
JUMPV
LABELV $3430
line 5674
;5673:	}
;5674:	trap_SendServerCommand( ent-g_entities, va(
ADDRGP4 $3433
ARGP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 968
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 5678
;5675:											   "print \"^3You have %d Badges of 27\n^3Your Stats: HTTP://BLOGWTF.COM/ZSERVER/PLAYER/%d\nDo !badgelist to see more! \n\"",
;5676:											   ent->client->pers.badgesobtained, ent->client->pers.mysqlid ) ); 
;5677:	
;5678:	return qtrue;
CNSTI4 1
RETI4
LABELV $3429
endproc G_badges 8 12
export G_badgelist
proc G_badgelist 36 8
line 5682
;5679:	
;5680:}
;5681:qboolean G_badgelist( gentity_t *ent, int skiparg )
;5682:{    
line 5690
;5683:	int i;
;5684:	int obt;
;5685:	/*
;5686:	 ADMBP( va( "^3!listmaps: ^7found %d maps matching '%s^7'.\n", count, search ) );
;5687:	 else
;5688:	 ADMBP( va( "^3!listmaps: ^7listing %d maps.\n", count ) );
;5689:	 */
;5690:	if(ent->client->pers.mysqlid == 1)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 1
NEI4 $3435
line 5691
;5691:	{
line 5692
;5692:		trap_SendServerCommand( ent-g_entities, va(
ADDRGP4 $3437
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
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
line 5694
;5693:												   "print \"^7In order to use badges you need an ^5updated ^7client\n^2Download from: ^5http://blogwtf.com/backport\n\"" ) );
;5694:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3434
JUMPV
LABELV $3435
line 5696
;5695:	}
;5696:	if(ent->client->pers.badgetimer > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 972
ADDP4
INDIRI4
ADDRGP4 level+28
INDIRI4
LEI4 $3438
line 5697
;5697:	{
line 5698
;5698:		ADMP( "^3You can only list badges every 60 seconds\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3441
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5699
;5699:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3434
JUMPV
LABELV $3438
line 5701
;5700:	}
;5701:	ent->client->pers.badgetimer = level.time + 60000;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 972
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 60000
ADDI4
ASGNI4
line 5702
;5702:	ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 5703
;5703:	for(i = 1; i <=40; i++ )
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $3443
line 5704
;5704:	{
line 5705
;5705:			if((ent->client->pers.badges[i] == 1 || ent->client->pers.badgeupdate[i] == 1))
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 772
ADDP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 16
INDIRI4
EQI4 $3449
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 822
ADDP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 16
INDIRI4
NEI4 $3447
LABELV $3449
line 5706
;5706:			{
line 5707
;5707:				ADMBP( "^3 " );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3450
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5708
;5708:				obt = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 5709
;5709:			}
ADDRGP4 $3448
JUMPV
LABELV $3447
line 5711
;5710:			else
;5711:			{
line 5712
;5712:				ADMBP( "^6 " );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3451
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5713
;5713:				obt = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 5714
;5714:			}
LABELV $3448
line 5715
;5715:		switch(i)
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $3452
ADDRLP4 0
INDIRI4
CNSTI4 40
GTI4 $3452
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $3587-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $3587
address $3454
address $3456
address $3461
address $3463
address $3469
address $3474
address $3476
address $3478
address $3480
address $3485
address $3490
address $3495
address $3500
address $3505
address $3510
address $3515
address $3520
address $3525
address $3527
address $3529
address $3531
address $3533
address $3535
address $3540
address $3542
address $3544
address $3549
address $3551
address $3553
address $3555
address $3560
address $3562
address $3564
address $3566
address $3568
address $3570
address $3575
address $3577
address $3579
address $3584
code
line 5716
;5716:		{
LABELV $3454
line 5718
;5717:			case 1:
;5718:				ADMBP( "[Get Your Hands Dirty] ^7- Kill your first zombie.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3455
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5719
;5719:				break;
ADDRGP4 $3453
JUMPV
LABELV $3456
line 5721
;5720:			case 2:
;5721:				if(!obt)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3457
line 5722
;5722:				{
line 5723
;5723:					ADMBP( va( "[Pro Sniper] ^1(%d/200) ^7- Get 200 headshots in a single game.\n", ent->client->pers.statscounters.headshots ));	
ADDRGP4 $3459
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1092
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5724
;5724:				} else {
ADDRGP4 $3453
JUMPV
LABELV $3457
line 5725
;5725:				ADMBP( "[Pro Sniper] ^7- Get 200 headshots in a single game.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3460
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5726
;5726:				}
line 5727
;5727:				break;
ADDRGP4 $3453
JUMPV
LABELV $3461
line 5729
;5728:			case 3:
;5729:				ADMBP( "[Sucks TuBe You] ^7- Get 12 kills in a single normal grenade launcher shot.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3462
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5730
;5730:				break;
ADDRGP4 $3453
JUMPV
LABELV $3463
line 5732
;5731:			case 4:
;5732:				  if(!obt && g_survival.integer)
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $3464
ADDRGP4 g_survival+12
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $3464
line 5733
;5733:				  {
line 5734
;5734:					  ADMBP( va( "[Bloodbath] ^1(%d/1000) ^7- Get 1000 kills in a single survival round.\n", ent->client->pers.statscounters.deaths ));
ADDRGP4 $3467
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1054
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5735
;5735:				  } else {
ADDRGP4 $3453
JUMPV
LABELV $3464
line 5736
;5736:					  ADMBP( "[Bloodbath] ^7- Get 1000 kills in a single survival round.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3468
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5737
;5737:				  }
line 5738
;5738:				break;
ADDRGP4 $3453
JUMPV
LABELV $3469
line 5740
;5739:			case 5:
;5740:				  if(!obt)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3470
line 5741
;5741:				{
line 5742
;5742:					ADMBP( va("[Laser Sight] ^1(%d/300) ^7- Get 300 kills in a row with the laser gun.\n", ent->client->pers.laserkills));
ADDRGP4 $3472
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 964
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5743
;5743:				} else {
ADDRGP4 $3453
JUMPV
LABELV $3470
line 5744
;5744:					ADMBP( "[Laser Sight] ^7- Get 300 kills in a row with the laser gun.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3473
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5745
;5745:				}
line 5746
;5746:				break;
ADDRGP4 $3453
JUMPV
LABELV $3474
line 5748
;5747:			case 6:
;5748:				ADMBP( "[First Blood] ^7- Get the first kill in a survival round.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3475
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5749
;5749:				break;
ADDRGP4 $3453
JUMPV
LABELV $3476
line 5751
;5750:			case 7:
;5751:				ADMBP( "[Jump Shot] ^7- Kill an enemy from the sky, without using any explosives or the lasergun.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3477
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5752
;5752:				break;
ADDRGP4 $3453
JUMPV
LABELV $3478
line 5754
;5753:			case 8:
;5754:				ADMBP( "[Trap Shoot] ^7- Kill an enemy with a shotgun while they are in the air.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3479
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5755
;5755:				break;
ADDRGP4 $3453
JUMPV
LABELV $3480
line 5757
;5756:			case 9:
;5757:				if(!obt)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3481
line 5758
;5758:				{
line 5759
;5759:					ADMBP( va("[Holey Zombies] ^1(%d/50) ^7- Fill 50 zombies with holes from a single chaingun clip.\n", ent->client->pers.chaingunkills ));
ADDRGP4 $3483
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 872
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5760
;5760:				} else {
ADDRGP4 $3453
JUMPV
LABELV $3481
line 5761
;5761:					ADMBP( "[Holey Zombies] ^7- Fill 50 zombies with holes from a single chaingun clip.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3484
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5762
;5762:				}
line 5763
;5763:				break;
ADDRGP4 $3453
JUMPV
LABELV $3485
line 5765
;5764:			case 10:
;5765:				if(!obt)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3486
line 5766
;5766:				{
line 5767
;5767:					ADMBP( va( "[Public Enemy No.1] ^1(%d/100) ^7- Get 100 Tommy Gun kills in one round.\n", ent->client->pers.tommykills ));
ADDRGP4 $3488
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 904
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5768
;5768:				} else {
ADDRGP4 $3453
JUMPV
LABELV $3486
line 5769
;5769:					ADMBP( "[Public Enemy No.1] ^7- Get 100 Tommy Gun kills in one round.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3489
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5770
;5770:				}
line 5771
;5771:				break;
ADDRGP4 $3453
JUMPV
LABELV $3490
line 5773
;5772:			case 11:
;5773:				if(!obt)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3491
line 5774
;5774:				{
line 5775
;5775:					ADMBP( va("[Gunslinger] ^1(%d/1000) ^7- Get 1,000 pistol kills.\n", ent->client->pers.pistolkills ));
ADDRGP4 $3493
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 900
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5776
;5776:				} else {
ADDRGP4 $3453
JUMPV
LABELV $3491
line 5777
;5777:					ADMBP( "[Gunslinger] ^7- Get 1,000 pistol kills.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3494
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5778
;5778:				}
line 5779
;5779:				break;
ADDRGP4 $3453
JUMPV
LABELV $3495
line 5781
;5780:			case 12:
;5781:				if(!obt)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3496
line 5782
;5782:				{
line 5783
;5783:					ADMBP( va( "[Survivor] ^1(%d/1000) ^7- Get 1,000 kills.\n", (ent->client->pers.totalkills + ent->client->pers.statscounters.kills)));
ADDRGP4 $3498
ARGP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 880
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 1052
ADDP4
INDIRI2
CVII4 2
ADDI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5784
;5784:				} else {
ADDRGP4 $3453
JUMPV
LABELV $3496
line 5785
;5785:					ADMBP( "[Survivor] ^7- Get 1,000 kills.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3499
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5786
;5786:				}
line 5787
;5787:				break;
ADDRGP4 $3453
JUMPV
LABELV $3500
line 5789
;5788:			case 13:
;5789:				if(!obt)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3501
line 5790
;5790:				{
line 5791
;5791:					ADMBP( va( "[Killer] ^1(%d/10000) ^7- Get 10,000 kills.\n", (ent->client->pers.totalkills + ent->client->pers.statscounters.kills)));
ADDRGP4 $3503
ARGP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 880
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 1052
ADDP4
INDIRI2
CVII4 2
ADDI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5792
;5792:				} else {
ADDRGP4 $3453
JUMPV
LABELV $3501
line 5793
;5793:					ADMBP( "[Killer] ^7- Get 10,000 kills.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3504
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5794
;5794:				}
line 5795
;5795:				break;
ADDRGP4 $3453
JUMPV
LABELV $3505
line 5797
;5796:			case 14:
;5797:				if(!obt)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3506
line 5798
;5798:				{
line 5799
;5799:					ADMBP( va( "[Deadly] ^1(%d/100000) ^7- Get 100,000 kills.\n", (ent->client->pers.totalkills + ent->client->pers.statscounters.kills)));
ADDRGP4 $3508
ARGP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 880
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 1052
ADDP4
INDIRI2
CVII4 2
ADDI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5800
;5800:				} else {
ADDRGP4 $3453
JUMPV
LABELV $3506
line 5801
;5801:					ADMBP( "[Deadly] ^7- Get 100,000 kills.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3509
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5802
;5802:				}
line 5803
;5803:				break;
ADDRGP4 $3453
JUMPV
LABELV $3510
line 5805
;5804:			case 15:
;5805:				if(!obt)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3511
line 5806
;5806:				{
line 5807
;5807:					ADMBP( va( "[Exterminator] ^1(%d/1000000) ^7- Get 1,000,000 kills.\n", (ent->client->pers.totalkills + ent->client->pers.statscounters.kills)));
ADDRGP4 $3513
ARGP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 880
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 1052
ADDP4
INDIRI2
CVII4 2
ADDI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5808
;5808:				} else {
ADDRGP4 $3453
JUMPV
LABELV $3511
line 5809
;5809:					ADMBP( "[Exterminator] ^7- Get 1,000,000 kills.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3514
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5810
;5810:				}
line 5811
;5811:				break;
ADDRGP4 $3453
JUMPV
LABELV $3515
line 5813
;5812:			case 16:
;5813:				if(!obt)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3516
line 5814
;5814:				{
line 5815
;5815:					ADMBP( va( "[Zombie Bait] ^1(%d/200) ^7- Die 200 times.\n", (ent->client->pers.totaldeaths + ent->client->pers.statscounters.deaths)));
ADDRGP4 $3518
ARGP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 884
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 1054
ADDP4
INDIRI2
CVII4 2
ADDI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5816
;5816:				} else {
ADDRGP4 $3453
JUMPV
LABELV $3516
line 5817
;5817:					ADMBP( "[Zombie Bait] ^7- Die 200 times.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3519
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5818
;5818:				}
line 5819
;5819:				break;
ADDRGP4 $3453
JUMPV
LABELV $3520
line 5821
;5820:			case 17:
;5821:				if(!obt)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3521
line 5822
;5822:				{
line 5823
;5823:					ADMBP( va( "[Champion] ^1(%d/500) ^7- Win 500 rounds.\n", ent->client->pers.gameswin));
ADDRGP4 $3523
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 888
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5824
;5824:				} else {
ADDRGP4 $3453
JUMPV
LABELV $3521
line 5825
;5825:					ADMBP( "[Champion] ^7- Win 500 rounds.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3524
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5826
;5826:				}
line 5827
;5827:				break;
ADDRGP4 $3453
JUMPV
LABELV $3525
line 5829
;5828:			case 18:
;5829:				ADMBP( "[Seen the Light] ^7- Go down to 1 hp then recover to at least 75 in survival.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3526
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5830
;5830:				break;
ADDRGP4 $3453
JUMPV
LABELV $3527
line 5832
;5831:			case 19:
;5832:				ADMBP( "[Axe Me a Question] ^7- Only get axe kills for an entire round.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3528
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5833
;5833:				break;
ADDRGP4 $3453
JUMPV
LABELV $3529
line 5835
;5834:			case 20:
;5835:				ADMBP( "[Multikill] ^7- Get 5 Mass Driver kills in one shot.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3530
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5836
;5836:				break;
ADDRGP4 $3453
JUMPV
LABELV $3531
line 5838
;5837:			case 21:
;5838:				ADMBP( "[Rocket Launched] ^7- Knock 5 enemies off the ground, killing them, with the rocket launcher in one round.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3532
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5839
;5839:				break;
ADDRGP4 $3453
JUMPV
LABELV $3533
line 5841
;5840:			case 22:
;5841:				ADMBP( "[It Went Boom!] ^7- Kill 10 enemies with one grenade.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3534
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5842
;5842:				break;
ADDRGP4 $3453
JUMPV
LABELV $3535
line 5844
;5843:			case 23:
;5844:				if(!obt)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3536
line 5845
;5845:				{
line 5846
;5846:					ADMBP( va( "[Minefield] ^1(%d/50) ^7- Kill 50 enemies with mines in one round.\n", ent->client->pers.minekills));
ADDRGP4 $3538
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 920
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5847
;5847:				} else {
ADDRGP4 $3453
JUMPV
LABELV $3536
line 5848
;5848:					ADMBP( "[Minefield] ^7- Kill 50 enemies with mines in one round.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3539
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5849
;5849:				}
line 5850
;5850:				break;
ADDRGP4 $3453
JUMPV
LABELV $3540
line 5852
;5851:			case 24:
;5852:				ADMBP( "[Burn baby Burn!] ^7- Light 7 zombies on fire with one incendiary round.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3541
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5853
;5853:				break;
ADDRGP4 $3453
JUMPV
LABELV $3542
line 5855
;5854:			case 25:
;5855:				ADMBP( "[Mr. Streaky] ^7- Kill at least one zombie every 2 seconds for 2 minutes.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3543
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5856
;5856:				break;
ADDRGP4 $3453
JUMPV
LABELV $3544
line 5858
;5857:			case 26:
;5858:			  if(!obt)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3545
line 5859
;5859:				{
line 5860
;5860:					ADMBP( va( "[Eradicaton] ^1(%d/200) ^7- Kill 200 zombie nodes.\n", ent->client->pers.structskilled));
ADDRGP4 $3547
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5861
;5861:				} else {
ADDRGP4 $3453
JUMPV
LABELV $3545
line 5862
;5862:					ADMBP( "[Eradication] ^7- Kill 200 zombie nodes.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3548
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5863
;5863:				}
line 5864
;5864:				break;
ADDRGP4 $3453
JUMPV
LABELV $3549
line 5866
;5865:			case 27:
;5866:				ADMBP( "[Ultimate Sacrifice] ^7- Deploy a medical dome that heals a teammate, dying in the process.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3550
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5867
;5867:				break;
ADDRGP4 $3453
JUMPV
LABELV $3551
line 5869
;5868:			case 28:
;5869:				ADMBP( "[Survivalist] ^7- Live for 30minutes in a survival round.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3552
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5870
;5870:				break;
ADDRGP4 $3453
JUMPV
LABELV $3553
line 5872
;5871:			case 29:
;5872:				ADMBP( "[Hands Tied] ^7- Make a zombie commit suicide.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3554
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5873
;5873:				break;
ADDRGP4 $3453
JUMPV
LABELV $3555
line 5875
;5874:			case 30:
;5875:				if(!obt)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3556
line 5876
;5876:				{
line 5877
;5877:					ADMBP( va( "[Wingman] ^1(%d/200) ^7- Get 200 assists in one round.\n", ent->client->pers.statscounters.assists) );
ADDRGP4 $3558
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1060
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5878
;5878:				} else {
ADDRGP4 $3453
JUMPV
LABELV $3556
line 5879
;5879:					ADMBP( "[Wingman] ^7- Get 200 assists in one round.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3559
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5880
;5880:				}
line 5881
;5881:				break;
ADDRGP4 $3453
JUMPV
LABELV $3560
line 5883
;5882:			case 31:
;5883:				ADMBP( "[Humanitarian] ^7- Survive the first 10minutes of a survival round without killing a zombie.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3561
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5884
;5884:				break;
ADDRGP4 $3453
JUMPV
LABELV $3562
line 5886
;5885:			case 32:
;5886:				ADMBP( "[Gibbed] ^7- Kill 20+ zombies at once with any weapon.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3563
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5887
;5887:				break;
ADDRGP4 $3453
JUMPV
LABELV $3564
line 5889
;5888:			case 33:
;5889:				ADMBP( "[Tastes Like Chicken] ^7- Eat a human.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3565
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5890
;5890:				break;
ADDRGP4 $3453
JUMPV
LABELV $3566
line 5892
;5891:			case 34:
;5892:				ADMBP( "[Fore!] ^7- Kill 6 zombies with a thrown axe.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3567
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5893
;5893:				break;
ADDRGP4 $3453
JUMPV
LABELV $3568
line 5895
;5894:			case 35:
;5895:				ADMBP( "[Last Man Standing] ^7- Make it to 20 minutes and be the last man alive.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3569
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5896
;5896:				break;
ADDRGP4 $3453
JUMPV
LABELV $3570
line 5898
;5897:			case 36:
;5898:				if(!obt)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3571
line 5899
;5899:				{
line 5900
;5900:					ADMBP( va( "[Guns Blazing] ^1(%d/100) ^7- Kill 100 zombies in a row with 20HP or less.\n", ent->client->pers.hurtkills ));
ADDRGP4 $3573
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 952
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5901
;5901:				} else {
ADDRGP4 $3453
JUMPV
LABELV $3571
line 5902
;5902:					ADMBP( "[Guns Blazing] ^7- Kill 100 zombies in a row with 20HP or less.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3574
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5903
;5903:				}
line 5904
;5904:				break;
ADDRGP4 $3453
JUMPV
LABELV $3575
line 5906
;5905:			case 37:
;5906:				ADMBP( "[Once you go human...] ^7- Taste your first human blood.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3576
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5907
;5907:				break;
ADDRGP4 $3453
JUMPV
LABELV $3577
line 5909
;5908:			case 38:
;5909:				ADMBP( "[Flawless] ^7- Go an entire round without getting hurt, and get at least 20 kills.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3578
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5910
;5910:				break;
ADDRGP4 $3453
JUMPV
LABELV $3579
line 5912
;5911:			case 39:
;5912:				if(!obt)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $3580
line 5913
;5913:				{
line 5914
;5914:					ADMBP( va( "[Medic] ^1(%d/6) ^7- Use 6 medikits on teammates, either domes or heals, in a single round.\n", ent->client->pers.heals ));
ADDRGP4 $3582
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 896
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5915
;5915:				} else {
ADDRGP4 $3453
JUMPV
LABELV $3580
line 5916
;5916:					ADMBP( "[Medic] ^7- Use 6 medikits on teammates, either domes or heals, in a single round.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3583
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5917
;5917:				}
line 5918
;5918:				break;
ADDRGP4 $3453
JUMPV
LABELV $3584
line 5920
;5919:			case 40:
;5920:				ADMBP( "[Ninja] ^7- In survival, don't get touched by a zombie for 5minutes.\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3585
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5921
;5921:				break;
ADDRGP4 $3453
JUMPV
LABELV $3452
line 5923
;5922:			default:
;5923:				ADMBP( "[Too many iterations]\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3586
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5924
;5924:				break;
LABELV $3453
line 5926
;5925:		}
;5926:	}
LABELV $3444
line 5703
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 40
LEI4 $3443
line 5927
;5927:	ADMBP("\n^3Won Already\n^6Pending\n\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3589
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5928
;5928:	ADMBP(va("^3More Information: HTTP://BLOGWTF.COM/ZSERVER/PLAYER/%d \n", ent->client->pers.mysqlid ) ); 
ADDRGP4 $3590
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5929
;5929:	ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 5931
;5930:	
;5931:	return qtrue;
CNSTI4 1
RETI4
LABELV $3434
endproc G_badgelist 36 8
export G_admin_message
proc G_admin_message 16 8
line 5936
;5932:	
;5933:}
;5934:
;5935:qboolean G_admin_message(gentity_t *ent, int skiparg)
;5936:{
line 5940
;5937:	int minargc;
;5938:	char *s;
;5939:	
;5940:	minargc = 2 + skiparg;
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 5942
;5941:	
;5942:	if( G_SayArgc() < minargc )
ADDRLP4 8
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $3592
line 5943
;5943:	{
line 5944
;5944:		ADMP( "^3!message: ^7usage: !message [message]\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3594
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 5945
;5945:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3591
JUMPV
LABELV $3592
line 5948
;5946:	}
;5947:	
;5948:	s = G_SayConcatArgs( 1 + skiparg );
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 12
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 5950
;5949:	
;5950:	trap_Cvar_Set( "g_enterString", s );
ADDRGP4 $3595
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 5951
;5951:	return qtrue;
CNSTI4 1
RETI4
LABELV $3591
endproc G_admin_message 16 8
export G_admin_mystats
proc G_admin_mystats 48 36
line 5955
;5952:}
;5953:
;5954:qboolean G_admin_mystats(gentity_t *ent, int skiparg)
;5955:{
line 5957
;5956:
;5957:	if (ent->client->pers.mysqlid > 0)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
LEI4 $3597
line 5958
;5958:	{
line 5959
;5959:	ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 5960
;5960:	ADMBP(va("%s^7:\n^3Level:^7 %d       ^3Kills:^7 %d       ^3Deaths:^7 %d\n^3Time Played:^7 %d minutes       ^3Games Won:^7 %d\n^3Structures Built:^7 %d       ^3Nodes Killed:^7 %d\n",ent->client->pers.netname, ex(ent->client->pers.playerlevel),(ex(ent->client->pers.totalkills) + ex(ent->client->pers.statscounters.kills)),(ex(ent->client->pers.totaldeaths) + ex(ent->client->pers.statscounters.deaths)), ex(ent->client->pers.timeplayed), ex(ent->client->pers.gameswin), ex(ent->client->pers.structsbuilt) + ex(ent->client->pers.statscounters.structsbuilt), ex(ent->client->pers.structskilled)));
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 ex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 880
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 ex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1052
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 8
ADDRGP4 ex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 884
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 ex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1054
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 16
ADDRGP4 ex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 ex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 888
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 ex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 928
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 ex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1076
ADDP4
INDIRI2
CVII4 2
ARGI4
ADDRLP4 32
ADDRGP4 ex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 ex
CALLI4
ASGNI4
ADDRGP4 $3599
ARGP4
ADDRLP4 40
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
ADDI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5961
;5961:	ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 5962
;5962:	return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $3596
JUMPV
LABELV $3597
line 5963
;5963:	} else {
line 5964
;5964:	ADMBP_begin();
ADDRGP4 G_admin_buffer_begin
CALLV
pop
line 5965
;5965:		ADMBP("^7In order to use mystats you need an ^5updated ^7client\n^2Download from: ^5http://blogwtf.com/backport\n");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $3600
ARGP4
ADDRGP4 G_admin_buffer_print
CALLV
pop
line 5966
;5966:	ADMBP_end();
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_admin_buffer_end
CALLV
pop
line 5967
;5967:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $3596
JUMPV
line 5969
;5968:	}
;5969:	return qfalse;
CNSTI4 0
RETI4
LABELV $3596
endproc G_admin_mystats 48 36
import ex
import mapRotations
bss
export g_admin_namelog
align 4
LABELV g_admin_namelog
skip 512
export g_admin_commands
align 4
LABELV g_admin_commands
skip 256
export g_admin_bans
align 4
LABELV g_admin_bans
skip 4096
export g_admin_admins
align 4
LABELV g_admin_admins
skip 4096
export g_admin_levels
align 4
LABELV g_admin_levels
skip 128
align 1
LABELV g_bfb
skip 32000
import ACEND_FindClosestSpawnNodeToEnemy
import ACEND_nodeInUse
import ACEND_setNextNode
import ACEND_setCurrentNode
import ACEND_pointVisibleFromEntity
import ACEND_selectNextNode
import ACESP_SetupBotState
import ACESP_BotConnect
import ACESP_RemoveBot
import ACESP_SpawnBot
import ACESP_SetName
import ACESP_FindFreeClient
import ACESP_Respawn
import ACESP_PutClientInServer
import ACESP_HoldSpawn
import ACESP_InitBots
import ACEND_CheckForDucking
import ACEND_RemoveNodeEdge
import ACEND_UpdateNodeEdge
import ACEND_NodeTypeToString
import ACEND_AddNode
import ACEND_ShowPath
import ACEND_DrawPath
import ACEND_ShowNode
import ACEND_InitNodes
import ACEND_PathMap
import ACEND_CheckForLadder
import ACEND_GrapFired
import ACEND_FollowPath
import ACEND_SetGoal
import ACEND_FindClosestReachableNode
import ACEND_FindCloseReachableNode
import ACEND_FindCost
import ACEMV_Wander
import ACEMV_Attack
import ACEMV_Move
import ACEMV_SpecialMove
import ACEIT_BuildItemNodeTable
import ACEIT_ItemNeed
import ACEIT_ChangeWeapon
import ACEIT_IsReachable
import ACEIT_IsVisible
import ACEIT_PlayerRemoved
import ACEIT_PlayerAdded
import ACECM_Commands
import ACEAI_ChooseWeapon
import ACEAI_FindEnemy
import ACEAI_PickShortRangeGoal
import ACEAI_PickLongRangeGoal
import ACEAI_CheckServerCommands
import ACEAI_Think
import ACEAI_StartFrame
import CopyToBodyQue
import SelectSpawnPoint
import ClientThink_real
import LookAtKiller
import nodes
import numNodes
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
LABELV $3600
byte 1 94
byte 1 55
byte 1 73
byte 1 110
byte 1 32
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 109
byte 1 121
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 110
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 94
byte 1 53
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 94
byte 1 55
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 94
byte 1 50
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 58
byte 1 32
byte 1 94
byte 1 53
byte 1 104
byte 1 116
byte 1 116
byte 1 112
byte 1 58
byte 1 47
byte 1 47
byte 1 98
byte 1 108
byte 1 111
byte 1 103
byte 1 119
byte 1 116
byte 1 102
byte 1 46
byte 1 99
byte 1 111
byte 1 109
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $3599
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 58
byte 1 10
byte 1 94
byte 1 51
byte 1 76
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 94
byte 1 51
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 94
byte 1 51
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 94
byte 1 51
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 100
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 94
byte 1 51
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 32
byte 1 87
byte 1 111
byte 1 110
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 94
byte 1 51
byte 1 83
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 66
byte 1 117
byte 1 105
byte 1 108
byte 1 116
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 94
byte 1 51
byte 1 78
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $3595
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $3594
byte 1 94
byte 1 51
byte 1 33
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 91
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $3590
byte 1 94
byte 1 51
byte 1 77
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 72
byte 1 84
byte 1 84
byte 1 80
byte 1 58
byte 1 47
byte 1 47
byte 1 66
byte 1 76
byte 1 79
byte 1 71
byte 1 87
byte 1 84
byte 1 70
byte 1 46
byte 1 67
byte 1 79
byte 1 77
byte 1 47
byte 1 90
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 47
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 47
byte 1 37
byte 1 100
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $3589
byte 1 10
byte 1 94
byte 1 51
byte 1 87
byte 1 111
byte 1 110
byte 1 32
byte 1 65
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 10
byte 1 94
byte 1 54
byte 1 80
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 10
byte 1 0
align 1
LABELV $3586
byte 1 91
byte 1 84
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $3585
byte 1 91
byte 1 78
byte 1 105
byte 1 110
byte 1 106
byte 1 97
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 73
byte 1 110
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 44
byte 1 32
byte 1 100
byte 1 111
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 117
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 53
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3583
byte 1 91
byte 1 77
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 54
byte 1 32
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 107
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 101
byte 1 105
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 100
byte 1 111
byte 1 109
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 115
byte 1 44
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3582
byte 1 91
byte 1 77
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 93
byte 1 32
byte 1 94
byte 1 49
byte 1 40
byte 1 37
byte 1 100
byte 1 47
byte 1 54
byte 1 41
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 54
byte 1 32
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 107
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 101
byte 1 105
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 100
byte 1 111
byte 1 109
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 115
byte 1 44
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3578
byte 1 91
byte 1 70
byte 1 108
byte 1 97
byte 1 119
byte 1 108
byte 1 101
byte 1 115
byte 1 115
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 111
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 104
byte 1 117
byte 1 114
byte 1 116
byte 1 44
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 50
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3576
byte 1 91
byte 1 79
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 103
byte 1 111
byte 1 32
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 46
byte 1 46
byte 1 46
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 84
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 32
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3574
byte 1 91
byte 1 71
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 66
byte 1 108
byte 1 97
byte 1 122
byte 1 105
byte 1 110
byte 1 103
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 111
byte 1 119
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 50
byte 1 48
byte 1 72
byte 1 80
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 108
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3573
byte 1 91
byte 1 71
byte 1 117
byte 1 110
byte 1 115
byte 1 32
byte 1 66
byte 1 108
byte 1 97
byte 1 122
byte 1 105
byte 1 110
byte 1 103
byte 1 93
byte 1 32
byte 1 94
byte 1 49
byte 1 40
byte 1 37
byte 1 100
byte 1 47
byte 1 49
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 111
byte 1 119
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 50
byte 1 48
byte 1 72
byte 1 80
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 108
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3569
byte 1 91
byte 1 76
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 77
byte 1 97
byte 1 110
byte 1 32
byte 1 83
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 77
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 50
byte 1 48
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 118
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3567
byte 1 91
byte 1 70
byte 1 111
byte 1 114
byte 1 101
byte 1 33
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 54
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 104
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 97
byte 1 120
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3565
byte 1 91
byte 1 84
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 76
byte 1 105
byte 1 107
byte 1 101
byte 1 32
byte 1 67
byte 1 104
byte 1 105
byte 1 99
byte 1 107
byte 1 101
byte 1 110
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 69
byte 1 97
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3563
byte 1 91
byte 1 71
byte 1 105
byte 1 98
byte 1 98
byte 1 101
byte 1 100
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 50
byte 1 48
byte 1 43
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3561
byte 1 91
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 105
byte 1 116
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 110
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 83
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 49
byte 1 48
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3559
byte 1 91
byte 1 87
byte 1 105
byte 1 110
byte 1 103
byte 1 109
byte 1 97
byte 1 110
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 50
byte 1 48
byte 1 48
byte 1 32
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3558
byte 1 91
byte 1 87
byte 1 105
byte 1 110
byte 1 103
byte 1 109
byte 1 97
byte 1 110
byte 1 93
byte 1 32
byte 1 94
byte 1 49
byte 1 40
byte 1 37
byte 1 100
byte 1 47
byte 1 50
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 50
byte 1 48
byte 1 48
byte 1 32
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3554
byte 1 91
byte 1 72
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 84
byte 1 105
byte 1 101
byte 1 100
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 77
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 115
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3552
byte 1 91
byte 1 83
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 76
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 51
byte 1 48
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3550
byte 1 91
byte 1 85
byte 1 108
byte 1 116
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 83
byte 1 97
byte 1 99
byte 1 114
byte 1 105
byte 1 102
byte 1 105
byte 1 99
byte 1 101
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 68
byte 1 101
byte 1 112
byte 1 108
byte 1 111
byte 1 121
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
byte 1 100
byte 1 111
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 44
byte 1 32
byte 1 100
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3548
byte 1 91
byte 1 69
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 50
byte 1 48
byte 1 48
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3547
byte 1 91
byte 1 69
byte 1 114
byte 1 97
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 111
byte 1 110
byte 1 93
byte 1 32
byte 1 94
byte 1 49
byte 1 40
byte 1 37
byte 1 100
byte 1 47
byte 1 50
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 50
byte 1 48
byte 1 48
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3543
byte 1 91
byte 1 77
byte 1 114
byte 1 46
byte 1 32
byte 1 83
byte 1 116
byte 1 114
byte 1 101
byte 1 97
byte 1 107
byte 1 121
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 50
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 50
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3541
byte 1 91
byte 1 66
byte 1 117
byte 1 114
byte 1 110
byte 1 32
byte 1 98
byte 1 97
byte 1 98
byte 1 121
byte 1 32
byte 1 66
byte 1 117
byte 1 114
byte 1 110
byte 1 33
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 55
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 111
byte 1 110
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
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3539
byte 1 91
byte 1 77
byte 1 105
byte 1 110
byte 1 101
byte 1 102
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 53
byte 1 48
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3538
byte 1 91
byte 1 77
byte 1 105
byte 1 110
byte 1 101
byte 1 102
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 93
byte 1 32
byte 1 94
byte 1 49
byte 1 40
byte 1 37
byte 1 100
byte 1 47
byte 1 53
byte 1 48
byte 1 41
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 53
byte 1 48
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 101
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3534
byte 1 91
byte 1 73
byte 1 116
byte 1 32
byte 1 87
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 66
byte 1 111
byte 1 111
byte 1 109
byte 1 33
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 49
byte 1 48
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3532
byte 1 91
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 75
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 53
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 102
byte 1 102
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 44
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 109
byte 1 44
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3530
byte 1 91
byte 1 77
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 53
byte 1 32
byte 1 77
byte 1 97
byte 1 115
byte 1 115
byte 1 32
byte 1 68
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3528
byte 1 91
byte 1 65
byte 1 120
byte 1 101
byte 1 32
byte 1 77
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 81
byte 1 117
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 120
byte 1 101
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3526
byte 1 91
byte 1 83
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 111
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 49
byte 1 32
byte 1 104
byte 1 112
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 55
byte 1 53
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3524
byte 1 91
byte 1 67
byte 1 104
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 111
byte 1 110
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 87
byte 1 105
byte 1 110
byte 1 32
byte 1 53
byte 1 48
byte 1 48
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3523
byte 1 91
byte 1 67
byte 1 104
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 111
byte 1 110
byte 1 93
byte 1 32
byte 1 94
byte 1 49
byte 1 40
byte 1 37
byte 1 100
byte 1 47
byte 1 53
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 87
byte 1 105
byte 1 110
byte 1 32
byte 1 53
byte 1 48
byte 1 48
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3519
byte 1 91
byte 1 90
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 32
byte 1 66
byte 1 97
byte 1 105
byte 1 116
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 68
byte 1 105
byte 1 101
byte 1 32
byte 1 50
byte 1 48
byte 1 48
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3518
byte 1 91
byte 1 90
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 32
byte 1 66
byte 1 97
byte 1 105
byte 1 116
byte 1 93
byte 1 32
byte 1 94
byte 1 49
byte 1 40
byte 1 37
byte 1 100
byte 1 47
byte 1 50
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 68
byte 1 105
byte 1 101
byte 1 32
byte 1 50
byte 1 48
byte 1 48
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3514
byte 1 91
byte 1 69
byte 1 120
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 44
byte 1 48
byte 1 48
byte 1 48
byte 1 44
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3513
byte 1 91
byte 1 69
byte 1 120
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 93
byte 1 32
byte 1 94
byte 1 49
byte 1 40
byte 1 37
byte 1 100
byte 1 47
byte 1 49
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 44
byte 1 48
byte 1 48
byte 1 48
byte 1 44
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3509
byte 1 91
byte 1 68
byte 1 101
byte 1 97
byte 1 100
byte 1 108
byte 1 121
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 44
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3508
byte 1 91
byte 1 68
byte 1 101
byte 1 97
byte 1 100
byte 1 108
byte 1 121
byte 1 93
byte 1 32
byte 1 94
byte 1 49
byte 1 40
byte 1 37
byte 1 100
byte 1 47
byte 1 49
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 44
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3504
byte 1 91
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 48
byte 1 44
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3503
byte 1 91
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 93
byte 1 32
byte 1 94
byte 1 49
byte 1 40
byte 1 37
byte 1 100
byte 1 47
byte 1 49
byte 1 48
byte 1 48
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 48
byte 1 44
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3499
byte 1 91
byte 1 83
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 111
byte 1 114
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 44
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3498
byte 1 91
byte 1 83
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 111
byte 1 114
byte 1 93
byte 1 32
byte 1 94
byte 1 49
byte 1 40
byte 1 37
byte 1 100
byte 1 47
byte 1 49
byte 1 48
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 44
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3494
byte 1 91
byte 1 71
byte 1 117
byte 1 110
byte 1 115
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 44
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 112
byte 1 105
byte 1 115
byte 1 116
byte 1 111
byte 1 108
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3493
byte 1 91
byte 1 71
byte 1 117
byte 1 110
byte 1 115
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 93
byte 1 32
byte 1 94
byte 1 49
byte 1 40
byte 1 37
byte 1 100
byte 1 47
byte 1 49
byte 1 48
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 44
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 112
byte 1 105
byte 1 115
byte 1 116
byte 1 111
byte 1 108
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3489
byte 1 91
byte 1 80
byte 1 117
byte 1 98
byte 1 108
byte 1 105
byte 1 99
byte 1 32
byte 1 69
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 78
byte 1 111
byte 1 46
byte 1 49
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 32
byte 1 84
byte 1 111
byte 1 109
byte 1 109
byte 1 121
byte 1 32
byte 1 71
byte 1 117
byte 1 110
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3488
byte 1 91
byte 1 80
byte 1 117
byte 1 98
byte 1 108
byte 1 105
byte 1 99
byte 1 32
byte 1 69
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 78
byte 1 111
byte 1 46
byte 1 49
byte 1 93
byte 1 32
byte 1 94
byte 1 49
byte 1 40
byte 1 37
byte 1 100
byte 1 47
byte 1 49
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 32
byte 1 84
byte 1 111
byte 1 109
byte 1 109
byte 1 121
byte 1 32
byte 1 71
byte 1 117
byte 1 110
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3484
byte 1 91
byte 1 72
byte 1 111
byte 1 108
byte 1 101
byte 1 121
byte 1 32
byte 1 90
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 115
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 70
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 53
byte 1 48
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 104
byte 1 111
byte 1 108
byte 1 101
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3483
byte 1 91
byte 1 72
byte 1 111
byte 1 108
byte 1 101
byte 1 121
byte 1 32
byte 1 90
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 115
byte 1 93
byte 1 32
byte 1 94
byte 1 49
byte 1 40
byte 1 37
byte 1 100
byte 1 47
byte 1 53
byte 1 48
byte 1 41
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 70
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 53
byte 1 48
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 104
byte 1 111
byte 1 108
byte 1 101
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 105
byte 1 110
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3479
byte 1 91
byte 1 84
byte 1 114
byte 1 97
byte 1 112
byte 1 32
byte 1 83
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 32
byte 1 119
byte 1 104
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 121
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 97
byte 1 105
byte 1 114
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3477
byte 1 91
byte 1 74
byte 1 117
byte 1 109
byte 1 112
byte 1 32
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 107
byte 1 121
byte 1 44
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 103
byte 1 117
byte 1 110
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3475
byte 1 91
byte 1 70
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 66
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3473
byte 1 91
byte 1 76
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 83
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 51
byte 1 48
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 111
byte 1 119
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3472
byte 1 91
byte 1 76
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 83
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 93
byte 1 32
byte 1 94
byte 1 49
byte 1 40
byte 1 37
byte 1 100
byte 1 47
byte 1 51
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 51
byte 1 48
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 111
byte 1 119
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3468
byte 1 91
byte 1 66
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 98
byte 1 97
byte 1 116
byte 1 104
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3467
byte 1 91
byte 1 66
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 98
byte 1 97
byte 1 116
byte 1 104
byte 1 93
byte 1 32
byte 1 94
byte 1 49
byte 1 40
byte 1 37
byte 1 100
byte 1 47
byte 1 49
byte 1 48
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 48
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 32
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3462
byte 1 91
byte 1 83
byte 1 117
byte 1 99
byte 1 107
byte 1 115
byte 1 32
byte 1 84
byte 1 117
byte 1 66
byte 1 101
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 49
byte 1 50
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3460
byte 1 91
byte 1 80
byte 1 114
byte 1 111
byte 1 32
byte 1 83
byte 1 110
byte 1 105
byte 1 112
byte 1 101
byte 1 114
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 50
byte 1 48
byte 1 48
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3459
byte 1 91
byte 1 80
byte 1 114
byte 1 111
byte 1 32
byte 1 83
byte 1 110
byte 1 105
byte 1 112
byte 1 101
byte 1 114
byte 1 93
byte 1 32
byte 1 94
byte 1 49
byte 1 40
byte 1 37
byte 1 100
byte 1 47
byte 1 50
byte 1 48
byte 1 48
byte 1 41
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 50
byte 1 48
byte 1 48
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3455
byte 1 91
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 72
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 68
byte 1 105
byte 1 114
byte 1 116
byte 1 121
byte 1 93
byte 1 32
byte 1 94
byte 1 55
byte 1 45
byte 1 32
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 122
byte 1 111
byte 1 109
byte 1 98
byte 1 105
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3451
byte 1 94
byte 1 54
byte 1 32
byte 1 0
align 1
LABELV $3450
byte 1 94
byte 1 51
byte 1 32
byte 1 0
align 1
LABELV $3441
byte 1 94
byte 1 51
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 54
byte 1 48
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
LABELV $3437
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 55
byte 1 73
byte 1 110
byte 1 32
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 110
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 94
byte 1 53
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 94
byte 1 55
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 94
byte 1 50
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 58
byte 1 32
byte 1 94
byte 1 53
byte 1 104
byte 1 116
byte 1 116
byte 1 112
byte 1 58
byte 1 47
byte 1 47
byte 1 98
byte 1 108
byte 1 111
byte 1 103
byte 1 119
byte 1 116
byte 1 102
byte 1 46
byte 1 99
byte 1 111
byte 1 109
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $3433
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 66
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 50
byte 1 55
byte 1 10
byte 1 94
byte 1 51
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 72
byte 1 84
byte 1 84
byte 1 80
byte 1 58
byte 1 47
byte 1 47
byte 1 66
byte 1 76
byte 1 79
byte 1 71
byte 1 87
byte 1 84
byte 1 70
byte 1 46
byte 1 67
byte 1 79
byte 1 77
byte 1 47
byte 1 90
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 47
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 47
byte 1 37
byte 1 100
byte 1 10
byte 1 68
byte 1 111
byte 1 32
byte 1 33
byte 1 98
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 101
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 33
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $3432
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 55
byte 1 73
byte 1 110
byte 1 32
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 110
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 94
byte 1 53
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 94
byte 1 55
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 94
byte 1 50
byte 1 68
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 58
byte 1 32
byte 1 94
byte 1 53
byte 1 104
byte 1 116
byte 1 116
byte 1 112
byte 1 58
byte 1 47
byte 1 47
byte 1 98
byte 1 108
byte 1 111
byte 1 103
byte 1 119
byte 1 116
byte 1 102
byte 1 46
byte 1 99
byte 1 111
byte 1 109
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $3428
byte 1 94
byte 1 51
byte 1 33
byte 1 119
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 100
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
byte 1 10
byte 1 0
align 1
LABELV $3427
byte 1 94
byte 1 51
byte 1 33
byte 1 119
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $3422
byte 1 94
byte 1 51
byte 1 33
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 33
byte 1 119
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $3418
byte 1 94
byte 1 55
byte 1 37
byte 1 52
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 49
byte 1 56
byte 1 115
byte 1 32
byte 1 37
byte 1 51
byte 1 51
byte 1 115
byte 1 10
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 94
byte 1 51
byte 1 92
byte 1 95
byte 1 95
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3405
byte 1 94
byte 1 51
byte 1 33
byte 1 103
byte 1 115
byte 1 121
byte 1 110
byte 1 99
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 102
byte 1 101
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 100
byte 1 97
byte 1 116
byte 1 97
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $3398
byte 1 94
byte 1 55
byte 1 37
byte 1 52
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 49
byte 1 56
byte 1 115
byte 1 32
byte 1 37
byte 1 49
byte 1 48
byte 1 115
byte 1 10
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 94
byte 1 51
byte 1 92
byte 1 95
byte 1 95
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3379
byte 1 94
byte 1 51
byte 1 76
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $3378
byte 1 94
byte 1 51
byte 1 76
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 49
byte 1 48
byte 1 32
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3375
byte 1 94
byte 1 51
byte 1 76
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 112
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3334
byte 1 94
byte 1 51
byte 1 33
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 32
byte 1 37
byte 1 100
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
byte 1 10
byte 1 0
align 1
LABELV $3333
byte 1 94
byte 1 51
byte 1 33
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $3328
byte 1 94
byte 1 51
byte 1 33
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 33
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $3295
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 49
byte 1 59
byte 1 0
align 1
LABELV $3294
byte 1 94
byte 1 51
byte 1 33
byte 1 76
byte 1 49
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 83
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 48
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3291
byte 1 94
byte 1 51
byte 1 33
byte 1 76
byte 1 49
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3288
byte 1 94
byte 1 51
byte 1 33
byte 1 76
byte 1 49
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 76
byte 1 49
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $3284
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 48
byte 1 59
byte 1 0
align 1
LABELV $3283
byte 1 94
byte 1 51
byte 1 33
byte 1 76
byte 1 48
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 46
byte 1 32
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 112
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 114
byte 1 105
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $3276
byte 1 94
byte 1 51
byte 1 33
byte 1 76
byte 1 48
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 109
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $3273
byte 1 94
byte 1 51
byte 1 33
byte 1 76
byte 1 48
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $3265
byte 1 94
byte 1 51
byte 1 33
byte 1 76
byte 1 48
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3252
byte 1 94
byte 1 51
byte 1 33
byte 1 76
byte 1 48
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 76
byte 1 48
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 124
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 35
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $3220
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 97
byte 1 110
byte 1 115
byte 1 105
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $3217
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $3168
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
byte 1 37
byte 1 115
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 115
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 73
byte 1 78
byte 1 70
byte 1 79
byte 1 95
byte 1 80
byte 1 65
byte 1 82
byte 1 83
byte 1 69
byte 1 95
byte 1 76
byte 1 79
byte 1 79
byte 1 80
byte 1 83
byte 1 10
byte 1 0
align 1
LABELV $3154
byte 1 94
byte 1 51
byte 1 33
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 110
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 108
byte 1 101
byte 1 118
byte 1 97
byte 1 110
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $3150
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 47
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 45
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $3149
byte 1 94
byte 1 51
byte 1 33
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 51
byte 1 33
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 94
byte 1 55
byte 1 40
byte 1 94
byte 1 53
byte 1 115
byte 1 117
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 94
byte 1 55
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $3148
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $3142
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $3141
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 111
byte 1 115
byte 1 101
byte 1 32
byte 1 99
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 114
byte 1 105
byte 1 97
byte 1 10
byte 1 0
align 1
LABELV $3138
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 110
byte 1 111
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 73
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $3126
byte 1 83
byte 1 115
byte 1 0
align 1
LABELV $3124
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $3119
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
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
byte 1 35
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $3114
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 105
byte 1 110
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 114
byte 1 121
byte 1 10
byte 1 0
align 1
LABELV $3087
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 117
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $3083
byte 1 94
byte 1 49
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 75
byte 1 73
byte 1 76
byte 1 76
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $3079
byte 1 94
byte 1 51
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
byte 1 105
byte 1 111
byte 1 110
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $3069
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 32
byte 1 97
byte 1 98
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 108
byte 1 105
byte 1 99
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 116
byte 1 111
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 114
byte 1 105
byte 1 100
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $3050
byte 1 104
byte 1 32
byte 1 0
align 1
LABELV $3049
byte 1 97
byte 1 32
byte 1 0
align 1
LABELV $3044
byte 1 35
byte 1 0
align 1
LABELV $3042
byte 1 37
byte 1 100
byte 1 32
byte 1 0
align 1
LABELV $3040
byte 1 120
byte 1 0
align 1
LABELV $3039
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 33
byte 1 0
align 1
LABELV $3017
byte 1 94
byte 1 50
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $2993
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 118
byte 1 111
byte 1 105
byte 1 100
byte 1 32
byte 1 102
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 44
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 32
byte 1 50
byte 1 53
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $2966
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 120
byte 1 110
byte 1 117
byte 1 109
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 35
byte 1 73
byte 1 68
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 45
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 110
byte 1 117
byte 1 109
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 97
byte 1 124
byte 1 104
byte 1 94
byte 1 55
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $2963
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 99
byte 1 97
byte 1 110
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 44
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 102
byte 1 117
byte 1 99
byte 1 107
byte 1 32
byte 1 117
byte 1 112
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $2959
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 110
byte 1 111
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2955
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 108
byte 1 111
byte 1 103
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 110
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 111
byte 1 115
byte 1 101
byte 1 32
byte 1 99
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 114
byte 1 105
byte 1 97
byte 1 10
byte 1 0
align 1
LABELV $2954
byte 1 37
byte 1 115
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 108
byte 1 111
byte 1 103
byte 1 58
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2937
byte 1 44
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 0
align 1
LABELV $2935
byte 1 110
byte 1 0
align 1
LABELV $2934
byte 1 37
byte 1 51
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2933
byte 1 94
byte 1 52
byte 1 72
byte 1 0
align 1
LABELV $2931
byte 1 94
byte 1 49
byte 1 65
byte 1 0
align 1
LABELV $2921
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 0
align 1
LABELV $2919
byte 1 44
byte 1 0
align 1
LABELV $2918
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2917
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2916
byte 1 97
byte 1 0
align 1
LABELV $2915
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $2914
byte 1 97
byte 1 101
byte 1 105
byte 1 111
byte 1 117
byte 1 65
byte 1 69
byte 1 73
byte 1 79
byte 1 85
byte 1 0
align 1
LABELV $2911
byte 1 116
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $2906
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $2893
byte 1 0
byte 1 0
align 1
LABELV $2892
byte 1 94
byte 1 49
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 75
byte 1 73
byte 1 76
byte 1 76
byte 1 69
byte 1 68
byte 1 94
byte 1 55
byte 1 32
byte 1 97
byte 1 0
align 1
LABELV $2890
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 0
align 1
LABELV $2888
byte 1 94
byte 1 51
byte 1 68
byte 1 69
byte 1 67
byte 1 79
byte 1 78
byte 1 83
byte 1 84
byte 1 82
byte 1 85
byte 1 67
byte 1 84
byte 1 69
byte 1 68
byte 1 94
byte 1 55
byte 1 32
byte 1 97
byte 1 0
align 1
LABELV $2886
byte 1 94
byte 1 50
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 116
byte 1 94
byte 1 55
byte 1 32
byte 1 97
byte 1 0
align 1
LABELV $2881
byte 1 60
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 62
byte 1 0
align 1
LABELV $2852
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 108
byte 1 111
byte 1 103
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 73
byte 1 68
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
byte 1 10
byte 1 0
align 1
LABELV $2841
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 108
byte 1 111
byte 1 103
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 110
byte 1 111
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2835
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 108
byte 1 111
byte 1 103
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2826
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2809
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 108
byte 1 111
byte 1 103
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $2804
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 104
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
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2803
byte 1 33
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 117
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $2795
byte 1 33
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 115
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
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
byte 1 115
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 0
align 1
LABELV $2785
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $2784
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2777
byte 1 82
byte 1 69
byte 1 65
byte 1 83
byte 1 79
byte 1 78
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $2776
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 119
byte 1 97
byte 1 114
byte 1 110
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
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 105
byte 1 115
byte 1 116
byte 1 114
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 46
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 67
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 105
byte 1 109
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 97
byte 1 116
byte 1 101
byte 1 108
byte 1 121
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 102
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 33
byte 1 10
byte 1 94
byte 1 49
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $2775
byte 1 94
byte 1 51
byte 1 33
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 115
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $2772
byte 1 94
byte 1 51
byte 1 33
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2769
byte 1 94
byte 1 51
byte 1 33
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 32
byte 1 91
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $2760
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2759
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 89
byte 1 111
byte 1 117
byte 1 39
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 34
byte 1 0
align 1
LABELV $2758
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $2752
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 114
byte 1 101
byte 1 118
byte 1 111
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2751
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 114
byte 1 101
byte 1 118
byte 1 111
byte 1 107
byte 1 101
byte 1 100
byte 1 34
byte 1 0
align 1
LABELV $2750
byte 1 94
byte 1 51
byte 1 33
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $2745
byte 1 94
byte 1 51
byte 1 33
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 115
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $2742
byte 1 94
byte 1 51
byte 1 33
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2737
byte 1 94
byte 1 51
byte 1 33
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $2727
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2725
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 121
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2718
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 65
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 121
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2712
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 34
byte 1 37
byte 1 99
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $2705
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 91
byte 1 97
byte 1 124
byte 1 104
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $2694
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $2693
byte 1 65
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $2692
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2690
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2683
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 65
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2677
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 34
byte 1 37
byte 1 99
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $2670
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 91
byte 1 97
byte 1 124
byte 1 104
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $2665
byte 1 94
byte 1 51
byte 1 33
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 108
byte 1 111
byte 1 103
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $2662
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 0
align 1
LABELV $2654
byte 1 37
byte 1 45
byte 1 50
byte 1 115
byte 1 32
byte 1 40
byte 1 42
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 37
byte 1 49
byte 1 53
byte 1 115
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $2626
byte 1 78
byte 1 0
align 1
LABELV $2622
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 117
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2621
byte 1 69
byte 1 118
byte 1 97
byte 1 99
byte 1 117
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $2616
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 105
byte 1 100
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
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2609
byte 1 94
byte 1 55
byte 1 40
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 41
byte 1 0
align 1
LABELV $2607
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2606
byte 1 82
byte 1 0
align 1
LABELV $2605
byte 1 94
byte 1 55
byte 1 40
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 32
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 41
byte 1 0
align 1
LABELV $2602
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $2601
byte 1 49
byte 1 0
align 1
LABELV $2600
byte 1 103
byte 1 95
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 65
byte 1 116
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $2566
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $2562
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $2561
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $2560
byte 1 107
byte 1 101
byte 1 101
byte 1 112
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $2559
byte 1 107
byte 1 101
byte 1 101
byte 1 112
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $2548
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2545
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2542
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 115
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $2539
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2536
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 32
byte 1 91
byte 1 110
byte 1 101
byte 1 119
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $2532
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 119
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 110
byte 1 105
byte 1 99
byte 1 107
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2531
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 59
byte 1 0
align 1
LABELV $2529
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $2522
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 32
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 117
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 117
byte 1 116
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 104
byte 1 116
byte 1 116
byte 1 112
byte 1 58
byte 1 47
byte 1 47
byte 1 116
byte 1 114
byte 1 101
byte 1 109
byte 1 46
byte 1 116
byte 1 106
byte 1 119
byte 1 46
byte 1 111
byte 1 114
byte 1 103
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 47
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 46
byte 1 32
byte 1 85
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 108
byte 1 115
byte 1 111
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $2511
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 57
byte 1 57
byte 1 57
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 116
byte 1 111
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
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2495
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 117
byte 1 110
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 33
byte 1 34
byte 1 0
align 1
LABELV $2490
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 117
byte 1 110
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 40
byte 1 80
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 41
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2486
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 46
byte 1 34
byte 1 0
align 1
LABELV $2481
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2473
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 89
byte 1 101
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2461
byte 1 94
byte 1 51
byte 1 33
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 94
byte 1 55
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2450
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 99
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 78
byte 1 111
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2438
byte 1 94
byte 1 51
byte 1 33
byte 1 99
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 94
byte 1 55
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2416
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 111
byte 1 116
byte 1 99
byte 1 109
byte 1 100
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 98
byte 1 111
byte 1 116
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 91
byte 1 98
byte 1 111
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 32
byte 1 91
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $2398
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $2393
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 32
byte 1 91
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 47
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 115
byte 1 93
byte 1 32
byte 1 40
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $2392
byte 1 94
byte 1 55
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $2387
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 91
byte 1 97
byte 1 100
byte 1 100
byte 1 47
byte 1 100
byte 1 101
byte 1 108
byte 1 93
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 32
byte 1 91
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 47
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 115
byte 1 93
byte 1 32
byte 1 40
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $2386
byte 1 94
byte 1 55
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $2383
byte 1 97
byte 1 100
byte 1 100
byte 1 0
align 1
LABELV $2380
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 91
byte 1 97
byte 1 100
byte 1 100
byte 1 47
byte 1 100
byte 1 101
byte 1 108
byte 1 93
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 32
byte 1 40
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 41
byte 1 32
byte 1 40
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $2379
byte 1 94
byte 1 55
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $2375
byte 1 94
byte 1 49
byte 1 68
byte 1 114
byte 1 97
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 71
byte 1 114
byte 1 105
byte 1 100
byte 1 32
byte 1 78
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 87
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 68
byte 1 105
byte 1 115
byte 1 115
byte 1 97
byte 1 112
byte 1 101
byte 1 97
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 49
byte 1 48
byte 1 32
byte 1 83
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $2322
byte 1 42
byte 1 0
align 1
LABELV $2320
byte 1 46
byte 1 0
align 1
LABELV $2314
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $2303
byte 1 78
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $2297
byte 1 78
byte 1 111
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $2276
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 108
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 115
byte 1 97
byte 1 121
byte 1 115
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 82
byte 1 69
byte 1 65
byte 1 68
byte 1 89
byte 1 32
byte 1 110
byte 1 111
byte 1 119
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2266
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 108
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
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
byte 1 10
byte 1 0
align 1
LABELV $2261
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 83
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2251
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 83
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 32
byte 1 83
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2249
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 83
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 32
byte 1 83
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2236
byte 1 40
byte 1 0
align 1
LABELV $2235
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $2216
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $2212
byte 1 94
byte 1 51
byte 1 33
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 110
byte 1 111
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $2210
byte 1 32
byte 1 94
byte 1 51
byte 1 83
byte 1 121
byte 1 110
byte 1 116
byte 1 97
byte 1 120
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 33
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2209
byte 1 32
byte 1 94
byte 1 51
byte 1 68
byte 1 101
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2208
byte 1 94
byte 1 51
byte 1 33
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $2198
byte 1 32
byte 1 94
byte 1 51
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $2196
byte 1 32
byte 1 94
byte 1 51
byte 1 83
byte 1 121
byte 1 110
byte 1 116
byte 1 97
byte 1 120
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 33
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2194
byte 1 32
byte 1 94
byte 1 51
byte 1 70
byte 1 117
byte 1 110
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2193
byte 1 94
byte 1 51
byte 1 33
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 39
byte 1 33
byte 1 37
byte 1 115
byte 1 39
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $2192
byte 1 94
byte 1 51
byte 1 33
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $2178
byte 1 114
byte 1 117
byte 1 110
byte 1 32
byte 1 33
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 32
byte 1 91
byte 1 94
byte 1 51
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 99
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $2177
byte 1 94
byte 1 51
byte 1 33
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2174
byte 1 32
byte 1 47
byte 1 115
byte 1 104
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 47
byte 1 100
byte 1 111
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $2170
byte 1 32
byte 1 47
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 47
byte 1 114
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 0
align 1
LABELV $2165
byte 1 32
byte 1 47
byte 1 109
byte 1 121
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $2161
byte 1 32
byte 1 47
byte 1 109
byte 1 101
byte 1 32
byte 1 47
byte 1 109
byte 1 116
byte 1 32
byte 1 47
byte 1 109
byte 1 101
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $2157
byte 1 32
byte 1 47
byte 1 109
byte 1 0
align 1
LABELV $2153
byte 1 32
byte 1 47
byte 1 97
byte 1 32
byte 1 47
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $2151
byte 1 65
byte 1 68
byte 1 77
byte 1 73
byte 1 78
byte 1 67
byte 1 72
byte 1 65
byte 1 84
byte 1 0
align 1
LABELV $2147
byte 1 32
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 47
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 0
align 1
LABELV $2133
byte 1 94
byte 1 51
byte 1 33
byte 1 37
byte 1 45
byte 1 49
byte 1 50
byte 1 115
byte 1 0
align 1
LABELV $2121
byte 1 94
byte 1 51
byte 1 33
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 58
byte 1 32
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 109
byte 1 121
byte 1 115
byte 1 113
byte 1 108
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $2116
byte 1 114
byte 1 117
byte 1 110
byte 1 32
byte 1 33
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 101
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $2107
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 100
byte 1 46
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $2106
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $2105
byte 1 105
byte 1 112
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $2102
byte 1 73
byte 1 80
byte 1 0
align 1
LABELV $2094
byte 1 37
byte 1 52
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 53
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 56
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 48
byte 1 115
byte 1 10
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 92
byte 1 95
byte 1 95
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2066
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2032
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 97
byte 1 114
byte 1 103
byte 1 117
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2031
byte 1 45
byte 1 115
byte 1 117
byte 1 98
byte 1 0
align 1
LABELV $1997
byte 1 94
byte 1 53
byte 1 32
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 114
byte 1 105
byte 1 100
byte 1 101
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 103
byte 1 95
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 116
byte 1 111
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1993
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 32
byte 1 32
byte 1 45
byte 1 32
byte 1 94
byte 1 55
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1988
byte 1 94
byte 1 37
byte 1 105
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 32
byte 1 94
byte 1 37
byte 1 105
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1987
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $1983
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $1975
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1966
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 84
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1960
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1959
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1950
byte 1 94
byte 1 55
byte 1 37
byte 1 50
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 50
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 50
byte 1 48
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1934
byte 1 46
byte 1 98
byte 1 115
byte 1 112
byte 1 0
align 1
LABELV $1933
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $1926
byte 1 37
byte 1 50
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 94
byte 1 49
byte 1 37
byte 1 49
byte 1 115
byte 1 37
byte 1 49
byte 1 115
byte 1 37
byte 1 49
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $1918
byte 1 41
byte 1 0
align 1
LABELV $1916
byte 1 40
byte 1 97
byte 1 46
byte 1 107
byte 1 46
byte 1 97
byte 1 46
byte 1 32
byte 1 0
align 1
LABELV $1914
byte 1 37
byte 1 50
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 40
byte 1 42
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 94
byte 1 49
byte 1 37
byte 1 49
byte 1 115
byte 1 37
byte 1 49
byte 1 115
byte 1 37
byte 1 49
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1891
byte 1 80
byte 1 0
align 1
LABELV $1890
byte 1 83
byte 1 69
byte 1 69
byte 1 83
byte 1 70
byte 1 85
byte 1 76
byte 1 76
byte 1 76
byte 1 73
byte 1 83
byte 1 84
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $1889
byte 1 68
byte 1 66
byte 1 85
byte 1 73
byte 1 76
byte 1 68
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $1888
byte 1 73
byte 1 78
byte 1 67
byte 1 79
byte 1 71
byte 1 78
byte 1 73
byte 1 84
byte 1 79
byte 1 0
align 1
LABELV $1883
byte 1 66
byte 1 0
align 1
LABELV $1872
byte 1 94
byte 1 53
byte 1 0
align 1
LABELV $1871
byte 1 67
byte 1 0
align 1
LABELV $1868
byte 1 94
byte 1 49
byte 1 0
align 1
LABELV $1865
byte 1 94
byte 1 52
byte 1 0
align 1
LABELV $1862
byte 1 83
byte 1 0
align 1
LABELV $1855
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 94
byte 1 55
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $1846
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1840
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $1835
byte 1 114
byte 1 117
byte 1 110
byte 1 32
byte 1 39
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 39
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 101
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1834
byte 1 114
byte 1 117
byte 1 110
byte 1 32
byte 1 39
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 39
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 101
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $1823
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 100
byte 1 46
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $1822
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 62
byte 1 50
byte 1 48
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 46
byte 1 32
byte 1 84
byte 1 114
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 110
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 32
byte 1 115
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 46
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $1821
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $1798
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 110
byte 1 111
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1797
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 110
byte 1 111
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1773
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 114
byte 1 101
byte 1 118
byte 1 111
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1772
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 89
byte 1 111
byte 1 117
byte 1 39
byte 1 118
byte 1 101
byte 1 32
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $1767
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 104
byte 1 97
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
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1761
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 111
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1760
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 89
byte 1 111
byte 1 117
byte 1 39
byte 1 118
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $1759
byte 1 94
byte 1 51
byte 1 33
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1745
byte 1 94
byte 1 51
byte 1 33
byte 1 99
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 99
byte 1 112
byte 1 32
byte 1 91
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $1738
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1737
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 89
byte 1 111
byte 1 117
byte 1 39
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 34
byte 1 0
align 1
LABELV $1736
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 121
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1730
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 117
byte 1 110
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1729
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 94
byte 1 49
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 117
byte 1 110
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 34
byte 1 0
align 1
LABELV $1728
byte 1 94
byte 1 51
byte 1 33
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1723
byte 1 94
byte 1 51
byte 1 33
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 115
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $1720
byte 1 94
byte 1 51
byte 1 33
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1717
byte 1 94
byte 1 51
byte 1 33
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 37
byte 1 115
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $1708
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1707
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1706
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 91
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $1703
byte 1 94
byte 1 51
byte 1 33
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 58
byte 1 32
byte 1 67
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 83
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 76
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 83
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 32
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1688
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $1687
byte 1 37
byte 1 115
byte 1 37
byte 1 50
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 54
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $1686
byte 1 32
byte 1 32
byte 1 45
byte 1 58
byte 1 45
byte 1 45
byte 1 0
align 1
LABELV $1685
byte 1 94
byte 1 51
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $1670
byte 1 94
byte 1 54
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 101
byte 1 118
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $1668
byte 1 94
byte 1 54
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $1666
byte 1 94
byte 1 50
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1664
byte 1 94
byte 1 54
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $1662
byte 1 94
byte 1 50
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1660
byte 1 94
byte 1 54
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $1658
byte 1 94
byte 1 53
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $1656
byte 1 94
byte 1 52
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 32
byte 1 119
byte 1 105
byte 1 110
byte 1 32
byte 1 94
byte 1 55
byte 1 47
byte 1 32
byte 1 65
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 115
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 116
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1654
byte 1 94
byte 1 52
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 32
byte 1 119
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1652
byte 1 94
byte 1 49
byte 1 65
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 32
byte 1 119
byte 1 105
byte 1 110
byte 1 32
byte 1 94
byte 1 55
byte 1 47
byte 1 32
byte 1 72
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 116
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1650
byte 1 94
byte 1 49
byte 1 65
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 32
byte 1 119
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1648
byte 1 94
byte 1 55
byte 1 116
byte 1 105
byte 1 101
byte 1 0
align 1
LABELV $1630
byte 1 37
byte 1 49
byte 1 115
byte 1 59
byte 1 37
byte 1 48
byte 1 51
byte 1 100
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 100
byte 1 59
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1626
byte 1 72
byte 1 0
align 1
LABELV $1620
byte 1 65
byte 1 0
align 1
LABELV $1595
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1594
byte 1 103
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 77
byte 1 97
byte 1 112
byte 1 76
byte 1 111
byte 1 103
byte 1 0
align 1
LABELV $1580
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1578
byte 1 68
byte 1 0
align 1
LABELV $1571
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 100
byte 1 101
byte 1 118
byte 1 109
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1569
byte 1 100
byte 1 101
byte 1 118
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1568
byte 1 94
byte 1 51
byte 1 33
byte 1 100
byte 1 101
byte 1 118
byte 1 109
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $1562
byte 1 94
byte 1 51
byte 1 33
byte 1 100
byte 1 101
byte 1 118
byte 1 109
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $1559
byte 1 94
byte 1 51
byte 1 33
byte 1 100
byte 1 101
byte 1 118
byte 1 109
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 100
byte 1 101
byte 1 118
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 91
byte 1 109
byte 1 97
byte 1 112
byte 1 93
byte 1 32
byte 1 40
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $1554
byte 1 77
byte 1 0
align 1
LABELV $1548
byte 1 40
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 41
byte 1 0
align 1
LABELV $1546
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 109
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1544
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1543
byte 1 94
byte 1 51
byte 1 33
byte 1 109
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $1542
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1540
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 100
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1539
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
LABELV $1534
byte 1 94
byte 1 51
byte 1 33
byte 1 109
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $1533
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 98
byte 1 115
byte 1 112
byte 1 0
align 1
LABELV $1530
byte 1 94
byte 1 51
byte 1 33
byte 1 109
byte 1 97
byte 1 112
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 91
byte 1 109
byte 1 97
byte 1 112
byte 1 93
byte 1 32
byte 1 40
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $1522
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 112
byte 1 117
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 112
byte 1 117
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1517
byte 1 94
byte 1 51
byte 1 33
byte 1 112
byte 1 117
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 99
byte 1 10
byte 1 0
align 1
LABELV $1515
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $1513
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $1508
byte 1 94
byte 1 51
byte 1 33
byte 1 112
byte 1 117
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 115
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $1505
byte 1 94
byte 1 51
byte 1 33
byte 1 112
byte 1 117
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1502
byte 1 94
byte 1 51
byte 1 33
byte 1 112
byte 1 117
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 112
byte 1 117
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 32
byte 1 91
byte 1 104
byte 1 124
byte 1 97
byte 1 124
byte 1 115
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $1490
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 35
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1487
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1481
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1477
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 35
byte 1 10
byte 1 0
align 1
LABELV $1471
byte 1 94
byte 1 51
byte 1 33
byte 1 117
byte 1 110
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 117
byte 1 110
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 91
byte 1 98
byte 1 97
byte 1 110
byte 1 35
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $1455
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 35
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 32
byte 1 45
byte 1 32
byte 1 37
byte 1 115
byte 1 41
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1454
byte 1 50
byte 1 53
byte 1 53
byte 1 46
byte 1 50
byte 1 53
byte 1 53
byte 1 46
byte 1 50
byte 1 53
byte 1 53
byte 1 46
byte 1 50
byte 1 53
byte 1 53
byte 1 0
align 1
LABELV $1453
byte 1 48
byte 1 46
byte 1 48
byte 1 46
byte 1 48
byte 1 46
byte 1 48
byte 1 0
align 1
LABELV $1452
byte 1 37
byte 1 104
byte 1 104
byte 1 117
byte 1 46
byte 1 37
byte 1 104
byte 1 104
byte 1 117
byte 1 46
byte 1 37
byte 1 104
byte 1 104
byte 1 117
byte 1 46
byte 1 37
byte 1 104
byte 1 104
byte 1 117
byte 1 0
align 1
LABELV $1449
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 32
byte 1 105
byte 1 115
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
byte 1 44
byte 1 32
byte 1 112
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 48
byte 1 45
byte 1 51
byte 1 50
byte 1 32
byte 1 105
byte 1 110
byte 1 99
byte 1 108
byte 1 117
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1443
byte 1 37
byte 1 105
byte 1 46
byte 1 37
byte 1 105
byte 1 46
byte 1 37
byte 1 105
byte 1 46
byte 1 37
byte 1 105
byte 1 47
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1422
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 49
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 97
byte 1 98
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 32
byte 1 110
byte 1 101
byte 1 116
byte 1 119
byte 1 111
byte 1 114
byte 1 107
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 33
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 91
byte 1 98
byte 1 97
byte 1 110
byte 1 93
byte 1 32
byte 1 91
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 93
byte 1 32
byte 1 33
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 94
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $1421
byte 1 33
byte 1 0
align 1
LABELV $1418
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 121
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 115
byte 1 117
byte 1 99
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 32
byte 1 110
byte 1 101
byte 1 116
byte 1 119
byte 1 111
byte 1 114
byte 1 107
byte 1 46
byte 1 32
byte 1 82
byte 1 101
byte 1 103
byte 1 117
byte 1 108
byte 1 97
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 121
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 62
byte 1 61
byte 1 49
byte 1 54
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1411
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 35
byte 1 10
byte 1 0
align 1
LABELV $1405
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 91
byte 1 98
byte 1 97
byte 1 110
byte 1 35
byte 1 93
byte 1 32
byte 1 91
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $1385
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $1383
byte 1 44
byte 1 32
byte 1 0
align 1
LABELV $1381
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $1378
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 35
byte 1 37
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1365
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $1360
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1351
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 110
byte 1 101
byte 1 119
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 108
byte 1 105
byte 1 99
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $1336
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1330
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 105
byte 1 102
byte 1 121
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1326
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 35
byte 1 10
byte 1 0
align 1
LABELV $1320
byte 1 94
byte 1 51
byte 1 33
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 91
byte 1 98
byte 1 97
byte 1 110
byte 1 35
byte 1 93
byte 1 32
byte 1 91
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 93
byte 1 32
byte 1 91
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $1309
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 44
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1302
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
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 58
byte 1 10
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 10
byte 1 37
byte 1 115
byte 1 10
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 10
byte 1 37
byte 1 115
byte 1 10
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $1295
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1292
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 44
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1288
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 115
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $1277
byte 1 45
byte 1 0
align 1
LABELV $1276
byte 1 37
byte 1 45
byte 1 50
byte 1 115
byte 1 32
byte 1 40
byte 1 42
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 37
byte 1 49
byte 1 53
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $1275
byte 1 94
byte 1 51
byte 1 0
align 1
LABELV $1258
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 108
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 44
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 73
byte 1 80
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $1255
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 110
byte 1 111
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 44
byte 1 32
byte 1 73
byte 1 80
byte 1 44
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $1221
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $1215
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1210
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 39
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1204
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 124
byte 1 105
byte 1 112
byte 1 93
byte 1 32
byte 1 91
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 93
byte 1 32
byte 1 91
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $1197
byte 1 67
byte 1 65
byte 1 78
byte 1 80
byte 1 69
byte 1 82
byte 1 77
byte 1 66
byte 1 65
byte 1 78
byte 1 0
align 1
LABELV $1187
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1186
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1185
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 44
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1178
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 10
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1177
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 58
byte 1 10
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1176
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
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 10
byte 1 37
byte 1 115
byte 1 10
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $1169
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1167
byte 1 94
byte 1 51
byte 1 33
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 115
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $1164
byte 1 94
byte 1 51
byte 1 33
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1161
byte 1 94
byte 1 51
byte 1 33
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 32
byte 1 91
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $1158
byte 1 85
byte 1 78
byte 1 65
byte 1 67
byte 1 67
byte 1 79
byte 1 85
byte 1 78
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 0
align 1
LABELV $1154
byte 1 94
byte 1 51
byte 1 33
byte 1 98
byte 1 97
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1146
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1136
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 47
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 47
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 32
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $1105
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 44
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 114
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1096
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1095
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1083
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 115
byte 1 111
byte 1 114
byte 1 114
byte 1 121
byte 1 44
byte 1 32
byte 1 98
byte 1 117
byte 1 116
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 10
byte 1 0
align 1
LABELV $1080
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 71
byte 1 85
byte 1 73
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $1077
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 46
byte 1 32
byte 1 32
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 101
byte 1 97
byte 1 100
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $1074
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 46
byte 1 32
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 33
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 112
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 114
byte 1 105
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 116
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $1039
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1027
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 97
byte 1 121
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 104
byte 1 105
byte 1 103
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $1014
byte 1 94
byte 1 51
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 33
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 93
byte 1 32
byte 1 91
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $1005
byte 1 94
byte 1 51
byte 1 33
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $986
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $961
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 91
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 93
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $960
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $957
byte 1 100
byte 1 101
byte 1 115
byte 1 99
byte 1 0
align 1
LABELV $954
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $951
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $946
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 91
byte 1 98
byte 1 97
byte 1 110
byte 1 93
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $945
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $942
byte 1 101
byte 1 120
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $939
byte 1 109
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $936
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $925
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 91
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 93
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $920
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $913
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 91
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 93
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $912
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $907
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $891
byte 1 91
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 93
byte 1 0
align 1
LABELV $890
byte 1 91
byte 1 98
byte 1 97
byte 1 110
byte 1 93
byte 1 0
align 1
LABELV $889
byte 1 91
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 93
byte 1 0
align 1
LABELV $888
byte 1 91
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 93
byte 1 0
align 1
LABELV $881
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
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
LABELV $877
byte 1 94
byte 1 51
byte 1 33
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 58
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 44
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 97
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $865
byte 1 71
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 95
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 108
byte 1 111
byte 1 103
byte 1 95
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 44
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 95
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 108
byte 1 111
byte 1 103
byte 1 115
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 10
byte 1 0
align 1
LABELV $819
byte 1 94
byte 1 51
byte 1 33
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 112
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 110
byte 1 105
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $810
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 45
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 101
byte 1 100
byte 1 59
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 102
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 103
byte 1 97
byte 1 105
byte 1 110
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $798
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $797
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 67
byte 1 72
byte 1 65
byte 1 84
byte 1 67
byte 1 77
byte 1 68
byte 1 0
align 1
LABELV $796
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $791
byte 1 66
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 71
byte 1 85
byte 1 73
byte 1 68
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $790
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $787
byte 1 66
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 73
byte 1 80
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $786
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $785
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $784
byte 1 66
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 40
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 35
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 41
byte 1 10
byte 1 0
align 1
LABELV $759
byte 1 37
byte 1 100
byte 1 46
byte 1 37
byte 1 100
byte 1 46
byte 1 37
byte 1 100
byte 1 46
byte 1 37
byte 1 100
byte 1 47
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $750
byte 1 66
byte 1 65
byte 1 78
byte 1 73
byte 1 77
byte 1 77
byte 1 85
byte 1 78
byte 1 73
byte 1 84
byte 1 89
byte 1 0
align 1
LABELV $739
byte 1 37
byte 1 105
byte 1 46
byte 1 37
byte 1 105
byte 1 46
byte 1 37
byte 1 105
byte 1 46
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $738
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $733
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $730
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 78
byte 1 111
byte 1 116
byte 1 105
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $726
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $725
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $722
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 104
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $719
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 100
byte 1 97
byte 1 121
byte 1 115
byte 1 0
align 1
LABELV $716
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 119
byte 1 101
byte 1 101
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $713
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 121
byte 1 101
byte 1 97
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $710
byte 1 80
byte 1 69
byte 1 82
byte 1 77
byte 1 65
byte 1 78
byte 1 69
byte 1 78
byte 1 84
byte 1 0
align 1
LABELV $669
byte 1 37
byte 1 52
byte 1 105
byte 1 32
byte 1 37
byte 1 52
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 40
byte 1 42
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 10
byte 1 0
align 1
LABELV $667
byte 1 37
byte 1 37
byte 1 37
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $637
byte 1 65
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $636
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $629
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $611
byte 1 37
byte 1 51
byte 1 105
byte 1 58
byte 1 37
byte 1 105
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $599
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 88
byte 1 0
align 1
LABELV $597
byte 1 37
byte 1 51
byte 1 105
byte 1 58
byte 1 37
byte 1 105
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $596
byte 1 97
byte 1 116
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $570
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 95
byte 1 108
byte 1 111
byte 1 103
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $562
byte 1 83
byte 1 84
byte 1 69
byte 1 65
byte 1 76
byte 1 84
byte 1 72
byte 1 0
align 1
LABELV $522
byte 1 65
byte 1 76
byte 1 76
byte 1 70
byte 1 76
byte 1 65
byte 1 71
byte 1 83
byte 1 32
byte 1 45
byte 1 73
byte 1 78
byte 1 67
byte 1 79
byte 1 71
byte 1 78
byte 1 73
byte 1 84
byte 1 79
byte 1 32
byte 1 45
byte 1 73
byte 1 77
byte 1 77
byte 1 85
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 45
byte 1 68
byte 1 66
byte 1 85
byte 1 73
byte 1 76
byte 1 68
byte 1 69
byte 1 82
byte 1 32
byte 1 45
byte 1 66
byte 1 65
byte 1 78
byte 1 73
byte 1 77
byte 1 77
byte 1 85
byte 1 78
byte 1 73
byte 1 84
byte 1 89
byte 1 0
align 1
LABELV $520
byte 1 94
byte 1 49
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 79
byte 1 112
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $518
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 112
byte 1 117
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 57
byte 1 57
byte 1 57
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 65
byte 1 68
byte 1 77
byte 1 73
byte 1 78
byte 1 67
byte 1 72
byte 1 65
byte 1 84
byte 1 32
byte 1 83
byte 1 69
byte 1 69
byte 1 83
byte 1 70
byte 1 85
byte 1 76
byte 1 76
byte 1 76
byte 1 73
byte 1 83
byte 1 84
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $516
byte 1 94
byte 1 51
byte 1 83
byte 1 101
byte 1 110
byte 1 105
byte 1 111
byte 1 114
byte 1 32
byte 1 65
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $514
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 112
byte 1 117
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 57
byte 1 57
byte 1 57
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 32
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 65
byte 1 68
byte 1 77
byte 1 73
byte 1 78
byte 1 67
byte 1 72
byte 1 65
byte 1 84
byte 1 32
byte 1 83
byte 1 69
byte 1 69
byte 1 83
byte 1 70
byte 1 85
byte 1 76
byte 1 76
byte 1 76
byte 1 73
byte 1 83
byte 1 84
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $512
byte 1 94
byte 1 50
byte 1 74
byte 1 117
byte 1 110
byte 1 105
byte 1 111
byte 1 114
byte 1 32
byte 1 65
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $510
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 112
byte 1 117
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 57
byte 1 57
byte 1 57
byte 1 32
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $508
byte 1 94
byte 1 54
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 77
byte 1 97
byte 1 110
byte 1 97
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $505
byte 1 94
byte 1 53
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 82
byte 1 101
byte 1 103
byte 1 117
byte 1 108
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $503
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $502
byte 1 94
byte 1 52
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $486
byte 1 32
byte 1 0
align 1
LABELV $478
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 58
byte 1 32
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 61
byte 1 32
byte 1 98
byte 1 101
byte 1 102
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $477
byte 1 61
byte 1 0
align 1
LABELV $472
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $471
byte 1 100
byte 1 101
byte 1 115
byte 1 99
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $470
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $469
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $468
byte 1 91
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $462
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $461
byte 1 101
byte 1 120
byte 1 112
byte 1 105
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $460
byte 1 109
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $459
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $458
byte 1 105
byte 1 112
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $457
byte 1 91
byte 1 98
byte 1 97
byte 1 110
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $449
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $448
byte 1 91
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $440
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 32
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $439
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $438
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 32
byte 1 32
byte 1 61
byte 1 32
byte 1 0
align 1
LABELV $437
byte 1 91
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $431
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 95
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 58
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 103
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $427
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
byte 1 103
byte 1 95
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 46
byte 1 32
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $419
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $417
byte 1 10
byte 1 0
align 1
LABELV $407
byte 1 73
byte 1 77
byte 1 77
byte 1 85
byte 1 84
byte 1 65
byte 1 66
byte 1 76
byte 1 69
byte 1 0
align 1
LABELV $406
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $386
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 32
byte 1 98
byte 1 101
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 111
byte 1 111
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 46
byte 1 0
align 1
LABELV $374
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 99
byte 1 108
byte 1 117
byte 1 100
byte 1 101
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 111
byte 1 111
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 46
byte 1 0
align 1
LABELV $371
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 45
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 99
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 111
byte 1 111
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 46
byte 1 0
align 1
LABELV $359
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 32
byte 1 100
byte 1 97
byte 1 115
byte 1 104
byte 1 46
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 111
byte 1 111
byte 1 115
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 46
byte 1 0
align 1
LABELV $355
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $343
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 39
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $342
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $339
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $297
byte 1 65
byte 1 76
byte 1 76
byte 1 70
byte 1 76
byte 1 65
byte 1 71
byte 1 83
byte 1 0
align 1
LABELV $282
byte 1 40
byte 1 94
byte 1 53
byte 1 32
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $281
byte 1 68
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $280
byte 1 119
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $279
byte 1 76
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 112
byte 1 115
byte 1 47
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $278
byte 1 119
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $277
byte 1 91
byte 1 94
byte 1 51
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 124
byte 1 105
byte 1 112
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 91
byte 1 94
byte 1 51
byte 1 35
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 124
byte 1 105
byte 1 112
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 91
byte 1 94
byte 1 51
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 94
byte 1 55
byte 1 93
byte 1 0
align 1
LABELV $276
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 105
byte 1 112
byte 1 47
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 32
byte 1 115
byte 1 121
byte 1 115
byte 1 116
byte 1 101
byte 1 109
byte 1 0
align 1
LABELV $275
byte 1 119
byte 1 97
byte 1 100
byte 1 100
byte 1 0
align 1
LABELV $274
byte 1 91
byte 1 94
byte 1 53
byte 1 49
byte 1 94
byte 1 55
byte 1 93
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 103
byte 1 115
byte 1 121
byte 1 110
byte 1 99
byte 1 32
byte 1 49
byte 1 39
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 114
byte 1 101
byte 1 45
byte 1 102
byte 1 101
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 100
byte 1 97
byte 1 116
byte 1 97
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $273
byte 1 114
byte 1 101
byte 1 45
byte 1 102
byte 1 101
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 100
byte 1 97
byte 1 116
byte 1 97
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 44
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $272
byte 1 103
byte 1 115
byte 1 121
byte 1 110
byte 1 99
byte 1 0
align 1
LABELV $271
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 35
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 124
byte 1 105
byte 1 112
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 49
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 32
byte 1 91
byte 1 94
byte 1 51
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 94
byte 1 55
byte 1 93
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 103
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 49
byte 1 32
byte 1 66
byte 1 97
byte 1 110
byte 1 32
byte 1 101
byte 1 118
byte 1 97
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 39
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 103
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 49
byte 1 50
byte 1 55
byte 1 46
byte 1 48
byte 1 46
byte 1 48
byte 1 46
byte 1 49
byte 1 32
byte 1 49
byte 1 32
byte 1 66
byte 1 97
byte 1 110
byte 1 32
byte 1 101
byte 1 118
byte 1 97
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 39
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 105
byte 1 112
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 49
byte 1 50
byte 1 55
byte 1 46
byte 1 48
byte 1 46
byte 1 32
byte 1 97
byte 1 107
byte 1 97
byte 1 32
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 103
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 49
byte 1 57
byte 1 50
byte 1 46
byte 1 49
byte 1 54
byte 1 56
byte 1 46
byte 1 48
byte 1 46
byte 1 49
byte 1 32
byte 1 66
byte 1 97
byte 1 110
byte 1 32
byte 1 101
byte 1 118
byte 1 97
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 39
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 105
byte 1 112
byte 1 32
byte 1 49
byte 1 57
byte 1 50
byte 1 46
byte 1 49
byte 1 54
byte 1 56
byte 1 46
byte 1 48
byte 1 46
byte 1 49
byte 1 10
byte 1 32
byte 1 94
byte 1 49
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 94
byte 1 55
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $270
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 44
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 101
byte 1 120
byte 1 116
byte 1 114
byte 1 101
byte 1 109
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $269
byte 1 103
byte 1 98
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $268
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 35
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 124
byte 1 105
byte 1 112
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 49
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 32
byte 1 91
byte 1 94
byte 1 51
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 94
byte 1 55
byte 1 93
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 103
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 32
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 49
byte 1 32
byte 1 65
byte 1 105
byte 1 109
byte 1 98
byte 1 111
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 104
byte 1 97
byte 1 99
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 39
byte 1 32
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 121
byte 1 99
byte 1 97
byte 1 112
byte 1 32
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 103
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 32
byte 1 49
byte 1 50
byte 1 55
byte 1 46
byte 1 48
byte 1 46
byte 1 48
byte 1 46
byte 1 49
byte 1 32
byte 1 49
byte 1 32
byte 1 65
byte 1 105
byte 1 109
byte 1 98
byte 1 111
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 104
byte 1 97
byte 1 99
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 39
byte 1 32
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 121
byte 1 99
byte 1 97
byte 1 112
byte 1 32
byte 1 105
byte 1 112
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 49
byte 1 50
byte 1 55
byte 1 46
byte 1 48
byte 1 46
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 103
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 32
byte 1 49
byte 1 57
byte 1 50
byte 1 46
byte 1 49
byte 1 54
byte 1 56
byte 1 46
byte 1 48
byte 1 46
byte 1 49
byte 1 32
byte 1 65
byte 1 105
byte 1 109
byte 1 98
byte 1 111
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 104
byte 1 97
byte 1 99
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 39
byte 1 32
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 121
byte 1 99
byte 1 97
byte 1 112
byte 1 32
byte 1 105
byte 1 112
byte 1 32
byte 1 49
byte 1 57
byte 1 50
byte 1 46
byte 1 49
byte 1 54
byte 1 56
byte 1 46
byte 1 48
byte 1 46
byte 1 49
byte 1 10
byte 1 32
byte 1 94
byte 1 49
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 118
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 94
byte 1 55
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $267
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 32
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 44
byte 1 32
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 105
byte 1 109
byte 1 98
byte 1 111
byte 1 116
byte 1 47
byte 1 119
byte 1 97
byte 1 108
byte 1 108
byte 1 104
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $266
byte 1 103
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $265
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 35
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 124
byte 1 105
byte 1 112
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 49
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 32
byte 1 91
byte 1 94
byte 1 51
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 94
byte 1 55
byte 1 93
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 103
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 49
byte 1 32
byte 1 68
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
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
byte 1 39
byte 1 32
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 103
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 49
byte 1 50
byte 1 55
byte 1 46
byte 1 48
byte 1 46
byte 1 48
byte 1 46
byte 1 49
byte 1 32
byte 1 49
byte 1 32
byte 1 68
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
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
byte 1 39
byte 1 32
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 105
byte 1 112
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 49
byte 1 50
byte 1 55
byte 1 46
byte 1 48
byte 1 46
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 103
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 49
byte 1 57
byte 1 50
byte 1 46
byte 1 49
byte 1 54
byte 1 56
byte 1 46
byte 1 48
byte 1 46
byte 1 49
byte 1 32
byte 1 68
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
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
byte 1 39
byte 1 32
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 105
byte 1 112
byte 1 32
byte 1 49
byte 1 57
byte 1 50
byte 1 46
byte 1 49
byte 1 54
byte 1 56
byte 1 46
byte 1 48
byte 1 46
byte 1 49
byte 1 10
byte 1 32
byte 1 94
byte 1 49
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 118
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 111
byte 1 102
byte 1 47
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 94
byte 1 55
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 47
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 0
align 1
LABELV $264
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 32
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 44
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $263
byte 1 103
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $262
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 35
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 124
byte 1 105
byte 1 112
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 49
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 32
byte 1 91
byte 1 94
byte 1 51
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 94
byte 1 55
byte 1 93
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 103
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 32
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 49
byte 1 32
byte 1 71
byte 1 114
byte 1 105
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 103
byte 1 39
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 32
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 103
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 32
byte 1 49
byte 1 50
byte 1 55
byte 1 46
byte 1 48
byte 1 46
byte 1 48
byte 1 46
byte 1 49
byte 1 32
byte 1 49
byte 1 32
byte 1 71
byte 1 114
byte 1 105
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 103
byte 1 39
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 32
byte 1 105
byte 1 112
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 49
byte 1 50
byte 1 55
byte 1 46
byte 1 48
byte 1 46
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 103
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 32
byte 1 49
byte 1 57
byte 1 50
byte 1 46
byte 1 49
byte 1 54
byte 1 56
byte 1 46
byte 1 48
byte 1 46
byte 1 49
byte 1 32
byte 1 71
byte 1 114
byte 1 105
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 103
byte 1 39
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 105
byte 1 112
byte 1 32
byte 1 49
byte 1 57
byte 1 50
byte 1 46
byte 1 49
byte 1 54
byte 1 56
byte 1 46
byte 1 48
byte 1 46
byte 1 49
byte 1 10
byte 1 32
byte 1 94
byte 1 49
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 118
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 94
byte 1 55
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $261
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 44
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $260
byte 1 103
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $259
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 35
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 124
byte 1 105
byte 1 112
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 49
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 91
byte 1 94
byte 1 51
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 94
byte 1 55
byte 1 93
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 103
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 32
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 49
byte 1 32
byte 1 73
byte 1 110
byte 1 110
byte 1 97
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 105
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 110
byte 1 103
byte 1 117
byte 1 97
byte 1 103
byte 1 101
byte 1 39
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 32
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 103
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 32
byte 1 49
byte 1 50
byte 1 55
byte 1 46
byte 1 48
byte 1 46
byte 1 48
byte 1 46
byte 1 51
byte 1 32
byte 1 49
byte 1 32
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 83
byte 1 112
byte 1 97
byte 1 109
byte 1 39
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 105
byte 1 112
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 49
byte 1 50
byte 1 55
byte 1 46
byte 1 48
byte 1 46
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 103
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 32
byte 1 49
byte 1 57
byte 1 50
byte 1 46
byte 1 49
byte 1 54
byte 1 56
byte 1 46
byte 1 48
byte 1 46
byte 1 49
byte 1 32
byte 1 84
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 39
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 112
byte 1 32
byte 1 49
byte 1 57
byte 1 50
byte 1 46
byte 1 49
byte 1 54
byte 1 56
byte 1 46
byte 1 48
byte 1 46
byte 1 49
byte 1 10
byte 1 32
byte 1 94
byte 1 49
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 118
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 111
byte 1 102
byte 1 47
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 47
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 117
byte 1 109
byte 1 112
byte 1 47
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 94
byte 1 55
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $258
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $257
byte 1 103
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $256
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $255
byte 1 103
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $254
byte 1 40
byte 1 94
byte 1 53
byte 1 32
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $253
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $252
byte 1 119
byte 1 0
align 1
LABELV $251
byte 1 103
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $250
byte 1 74
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 100
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $249
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $248
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $247
byte 1 35
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $246
byte 1 83
byte 1 101
byte 1 116
byte 1 32
byte 1 38
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $245
byte 1 115
byte 1 117
byte 1 114
byte 1 118
byte 1 105
byte 1 118
byte 1 97
byte 1 108
byte 1 115
byte 1 116
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $244
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $243
byte 1 115
byte 1 101
byte 1 116
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $242
byte 1 70
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 109
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $241
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $240
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $239
byte 1 68
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 102
byte 1 117
byte 1 99
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $238
byte 1 80
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 103
byte 1 114
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $237
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 103
byte 1 114
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $236
byte 1 83
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $235
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $234
byte 1 100
byte 1 111
byte 1 32
byte 1 105
byte 1 116
byte 1 33
byte 1 0
align 1
LABELV $233
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 100
byte 1 97
byte 1 116
byte 1 97
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $232
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 100
byte 1 98
byte 1 0
align 1
LABELV $231
byte 1 68
byte 1 111
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 97
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $230
byte 1 68
byte 1 114
byte 1 97
byte 1 119
byte 1 32
byte 1 71
byte 1 114
byte 1 105
byte 1 100
byte 1 32
byte 1 78
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $229
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $228
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 91
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 93
byte 1 0
align 1
LABELV $227
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 101
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 102
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $226
byte 1 119
byte 1 97
byte 1 114
byte 1 110
byte 1 0
align 1
LABELV $225
byte 1 117
byte 1 110
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $224
byte 1 117
byte 1 110
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $223
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $222
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $221
byte 1 114
byte 1 101
byte 1 118
byte 1 111
byte 1 107
byte 1 101
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 112
byte 1 114
byte 1 105
byte 1 118
byte 1 105
byte 1 108
byte 1 101
byte 1 103
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $220
byte 1 117
byte 1 110
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $219
byte 1 91
byte 1 94
byte 1 51
byte 1 98
byte 1 97
byte 1 110
byte 1 35
byte 1 94
byte 1 55
byte 1 93
byte 1 0
align 1
LABELV $218
byte 1 117
byte 1 110
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $217
byte 1 117
byte 1 110
byte 1 98
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $216
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $215
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $214
byte 1 91
byte 1 94
byte 1 51
byte 1 98
byte 1 97
byte 1 110
byte 1 35
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 91
byte 1 94
byte 1 53
byte 1 67
byte 1 73
byte 1 68
byte 1 82
byte 1 32
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 94
byte 1 55
byte 1 93
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 49
byte 1 48
byte 1 32
byte 1 49
byte 1 54
byte 1 39
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 35
byte 1 49
byte 1 48
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 88
byte 1 88
byte 1 88
byte 1 46
byte 1 88
byte 1 88
byte 1 88
byte 1 46
byte 1 42
byte 1 46
byte 1 42
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 49
byte 1 48
byte 1 32
byte 1 50
byte 1 52
byte 1 39
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 35
byte 1 49
byte 1 48
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 88
byte 1 88
byte 1 88
byte 1 46
byte 1 88
byte 1 88
byte 1 88
byte 1 46
byte 1 88
byte 1 88
byte 1 88
byte 1 46
byte 1 42
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 49
byte 1 48
byte 1 32
byte 1 51
byte 1 50
byte 1 39
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 35
byte 1 49
byte 1 48
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 117
byte 1 108
byte 1 97
byte 1 114
byte 1 32
byte 1 40
byte 1 110
byte 1 111
byte 1 110
byte 1 45
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 41
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 10
byte 1 32
byte 1 94
byte 1 49
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 121
byte 1 32
byte 1 109
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 46
byte 1 100
byte 1 97
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 116
byte 1 105
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 111
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 113
byte 1 118
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $213
byte 1 65
byte 1 100
byte 1 100
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $212
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $211
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 115
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
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
byte 1 115
byte 1 0
align 1
LABELV $210
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $209
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 32
byte 1 57
byte 1 57
byte 1 57
byte 1 32
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
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
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $208
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 57
byte 1 57
byte 1 57
byte 1 0
align 1
LABELV $207
byte 1 40
byte 1 94
byte 1 53
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 35
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 73
byte 1 80
byte 1 124
byte 1 39
byte 1 45
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 39
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $206
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 40
byte 1 112
byte 1 97
byte 1 114
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 41
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $205
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 98
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $204
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 124
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 35
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 91
byte 1 94
byte 1 51
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 94
byte 1 55
byte 1 93
byte 1 0
align 1
LABELV $203
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $202
byte 1 115
byte 1 101
byte 1 116
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $201
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 97
byte 1 114
byte 1 101
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
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $200
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $199
byte 1 40
byte 1 94
byte 1 53
byte 1 120
byte 1 110
byte 1 117
byte 1 109
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 35
byte 1 73
byte 1 68
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 45
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 110
byte 1 117
byte 1 109
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 97
byte 1 124
byte 1 104
byte 1 94
byte 1 55
byte 1 41
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 32
byte 1 120
byte 1 53
byte 1 32
byte 1 104
byte 1 39
byte 1 32
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 32
byte 1 53
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 32
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
LABELV $198
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 44
byte 1 32
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 108
byte 1 121
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $197
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $196
byte 1 40
byte 1 94
byte 1 53
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 107
byte 1 101
byte 1 101
byte 1 112
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 124
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 124
byte 1 107
byte 1 101
byte 1 101
byte 1 112
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 124
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $195
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 40
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 108
byte 1 121
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 107
byte 1 101
byte 1 101
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 47
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $194
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $193
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 101
byte 1 119
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 94
byte 1 55
byte 1 93
byte 1 0
align 1
LABELV $192
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $191
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $190
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 105
byte 1 116
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 98
byte 1 101
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 111
byte 1 116
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 0
align 1
LABELV $189
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
LABELV $188
byte 1 114
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 101
byte 1 115
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $187
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 0
align 1
LABELV $186
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 91
byte 1 94
byte 1 51
byte 1 104
byte 1 124
byte 1 97
byte 1 124
byte 1 115
byte 1 94
byte 1 55
byte 1 93
byte 1 0
align 1
LABELV $185
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $184
byte 1 112
byte 1 117
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $183
byte 1 80
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 40
byte 1 111
byte 1 114
byte 1 32
byte 1 117
byte 1 110
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 41
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 0
align 1
LABELV $182
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $181
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 121
byte 1 32
byte 1 116
byte 1 97
byte 1 107
byte 1 105
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
LABELV $180
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $179
byte 1 103
byte 1 111
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $178
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $177
byte 1 40
byte 1 94
byte 1 53
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $176
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 121
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $175
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 108
byte 1 111
byte 1 103
byte 1 0
align 1
LABELV $174
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $173
byte 1 109
byte 1 121
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $172
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $171
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $170
byte 1 91
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 93
byte 1 0
align 1
LABELV $169
byte 1 68
byte 1 79
byte 1 32
byte 1 78
byte 1 79
byte 1 84
byte 1 32
byte 1 85
byte 1 83
byte 1 69
byte 1 33
byte 1 32
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 114
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 46
byte 1 0
align 1
LABELV $168
byte 1 115
byte 1 0
align 1
LABELV $167
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $166
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 108
byte 1 121
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $165
byte 1 109
byte 1 97
byte 1 112
byte 1 108
byte 1 111
byte 1 103
byte 1 0
align 1
LABELV $164
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 40
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 108
byte 1 121
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 41
byte 1 0
align 1
LABELV $163
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $162
byte 1 91
byte 1 94
byte 1 51
byte 1 97
byte 1 124
byte 1 104
byte 1 94
byte 1 55
byte 1 93
byte 1 0
align 1
LABELV $161
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $160
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $159
byte 1 40
byte 1 94
byte 1 53
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $158
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 97
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $157
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $156
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 44
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 105
byte 1 114
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 105
byte 1 114
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $155
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $154
byte 1 40
byte 1 94
byte 1 53
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $153
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 97
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $152
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $151
byte 1 40
byte 1 94
byte 1 53
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 35
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 109
byte 1 105
byte 1 110
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $150
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 105
byte 1 114
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $149
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $148
byte 1 91
byte 1 94
byte 1 51
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 94
byte 1 55
byte 1 93
byte 1 0
align 1
LABELV $147
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 0
align 1
LABELV $146
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $145
byte 1 83
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 48
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $144
byte 1 108
byte 1 49
byte 1 0
align 1
LABELV $143
byte 1 76
byte 1 49
byte 1 0
align 1
LABELV $142
byte 1 83
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 49
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 48
byte 1 0
align 1
LABELV $141
byte 1 108
byte 1 48
byte 1 0
align 1
LABELV $140
byte 1 76
byte 1 48
byte 1 0
align 1
LABELV $139
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $138
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $137
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $136
byte 1 40
byte 1 94
byte 1 53
byte 1 115
byte 1 117
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $135
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 116
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $134
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $133
byte 1 40
byte 1 94
byte 1 53
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $132
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 118
byte 1 97
byte 1 105
byte 1 108
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 99
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $131
byte 1 91
byte 1 94
byte 1 51
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $130
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 115
byte 1 32
byte 1 40
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 108
byte 1 121
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 121
byte 1 111
byte 1 117
byte 1 116
byte 1 41
byte 1 0
align 1
LABELV $129
byte 1 100
byte 1 101
byte 1 118
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $128
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 112
byte 1 114
byte 1 105
byte 1 118
byte 1 105
byte 1 108
byte 1 101
byte 1 103
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $127
byte 1 100
byte 1 101
byte 1 115
byte 1 105
byte 1 103
byte 1 110
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $126
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 97
byte 1 119
byte 1 97
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 39
byte 1 115
byte 1 32
byte 1 97
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $125
byte 1 40
byte 1 45
byte 1 65
byte 1 72
byte 1 83
byte 1 41
byte 1 32
byte 1 91
byte 1 94
byte 1 51
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 94
byte 1 55
byte 1 93
byte 1 0
align 1
LABELV $124
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 67
byte 1 80
byte 1 32
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 115
byte 1 44
byte 1 32
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 108
byte 1 121
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 40
byte 1 115
byte 1 41
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 0
align 1
LABELV $123
byte 1 99
byte 1 112
byte 1 0
align 1
LABELV $122
byte 1 99
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 108
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 116
byte 1 97
byte 1 107
byte 1 105
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
LABELV $121
byte 1 99
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $120
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 91
byte 1 94
byte 1 53
byte 1 114
byte 1 101
byte 1 103
byte 1 117
byte 1 108
byte 1 97
byte 1 114
byte 1 47
byte 1 105
byte 1 100
byte 1 108
byte 1 101
byte 1 47
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 100
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 47
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 105
byte 1 100
byte 1 108
byte 1 101
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 94
byte 1 55
byte 1 93
byte 1 0
align 1
LABELV $119
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 104
byte 1 97
byte 1 118
byte 1 105
byte 1 111
byte 1 114
byte 1 46
byte 1 0
align 1
LABELV $118
byte 1 122
byte 1 0
align 1
LABELV $117
byte 1 98
byte 1 111
byte 1 116
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $116
byte 1 91
byte 1 94
byte 1 51
byte 1 97
byte 1 100
byte 1 100
byte 1 47
byte 1 100
byte 1 101
byte 1 108
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 91
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 32
byte 1 91
byte 1 94
byte 1 53
byte 1 97
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 115
byte 1 47
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 40
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 41
byte 1 0
align 1
LABELV $115
byte 1 65
byte 1 100
byte 1 100
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 40
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $114
byte 1 90
byte 1 0
align 1
LABELV $113
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $112
byte 1 40
byte 1 94
byte 1 53
byte 1 120
byte 1 110
byte 1 117
byte 1 109
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 35
byte 1 115
byte 1 107
byte 1 105
byte 1 112
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 45
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 110
byte 1 117
byte 1 109
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 97
byte 1 124
byte 1 104
byte 1 94
byte 1 55
byte 1 41
byte 1 10
byte 1 32
byte 1 94
byte 1 51
byte 1 69
byte 1 120
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 39
byte 1 33
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 108
byte 1 111
byte 1 103
byte 1 32
byte 1 35
byte 1 49
byte 1 48
byte 1 32
byte 1 104
byte 1 39
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 112
byte 1 115
byte 1 32
byte 1 49
byte 1 48
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 44
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 105
byte 1 111
byte 1 117
byte 1 115
byte 1 32
byte 1 49
byte 1 48
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 32
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
LABELV $111
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
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
byte 1 115
byte 1 44
byte 1 32
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 108
byte 1 121
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $110
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 108
byte 1 111
byte 1 103
byte 1 0
align 1
LABELV $109
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 124
byte 1 73
byte 1 80
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $108
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 73
byte 1 80
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 71
byte 1 85
byte 1 73
byte 1 68
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 105
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 46
byte 1 32
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 117
byte 1 110
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 39
byte 1 119
byte 1 39
byte 1 32
byte 1 40
byte 1 119
byte 1 101
byte 1 101
byte 1 107
byte 1 115
byte 1 41
byte 1 44
byte 1 32
byte 1 39
byte 1 100
byte 1 39
byte 1 32
byte 1 40
byte 1 100
byte 1 97
byte 1 121
byte 1 115
byte 1 41
byte 1 44
byte 1 32
byte 1 39
byte 1 104
byte 1 39
byte 1 32
byte 1 40
byte 1 104
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 41
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 39
byte 1 109
byte 1 39
byte 1 32
byte 1 40
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 41
byte 1 44
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 105
byte 1 102
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 117
byte 1 110
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $107
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $106
byte 1 76
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 66
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $105
byte 1 98
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $104
byte 1 65
byte 1 110
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 97
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 33
byte 1 98
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $103
byte 1 98
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $102
byte 1 66
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $101
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 0
align 1
LABELV $100
byte 1 98
byte 1 97
byte 1 100
byte 1 103
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $99
byte 1 109
byte 1 97
byte 1 107
byte 1 101
byte 1 115
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
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
LABELV $98
byte 1 97
byte 1 108
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 0
align 1
LABELV $97
byte 1 91
byte 1 94
byte 1 51
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 124
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 35
byte 1 94
byte 1 55
byte 1 93
byte 1 0
align 1
LABELV $96
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 39
byte 1 115
byte 1 32
byte 1 97
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $95
byte 1 100
byte 1 101
byte 1 110
byte 1 121
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $94
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 0
align 1
LABELV $93
byte 1 0
align 1
LABELV $92
byte 1 100
byte 1 105
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $91
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $90
byte 1 91
byte 1 94
byte 1 51
byte 1 98
byte 1 97
byte 1 110
byte 1 35
byte 1 94
byte 1 55
byte 1 93
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 94
byte 1 55
byte 1 41
byte 1 32
byte 1 40
byte 1 94
byte 1 53
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 94
byte 1 55
byte 1 41
byte 1 0
align 1
LABELV $89
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 46
byte 1 32
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 117
byte 1 110
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 39
byte 1 119
byte 1 39
byte 1 32
byte 1 40
byte 1 119
byte 1 101
byte 1 101
byte 1 107
byte 1 115
byte 1 41
byte 1 44
byte 1 32
byte 1 39
byte 1 100
byte 1 39
byte 1 32
byte 1 40
byte 1 100
byte 1 97
byte 1 121
byte 1 115
byte 1 41
byte 1 44
byte 1 32
byte 1 39
byte 1 104
byte 1 39
byte 1 32
byte 1 40
byte 1 104
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 41
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 39
byte 1 109
byte 1 39
byte 1 32
byte 1 40
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 115
byte 1 41
byte 1 44
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 105
byte 1 102
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 117
byte 1 110
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 32
byte 1 105
byte 1 102
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 99
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 43
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 45
byte 1 44
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 32
byte 1 100
byte 1 117
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 101
byte 1 120
byte 1 116
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 109
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $88
byte 1 98
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $87
byte 1 97
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 98
byte 1 97
byte 1 110
byte 1 0
