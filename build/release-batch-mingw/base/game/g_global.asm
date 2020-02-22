export G_globalInit
code
proc G_globalInit 288 12
file "..\..\..\..\src/game/g_global.c"
line 26
;1:/*
;2: ===========================================================================
;3: Copyright (C) 2011 Diego Michel Rubio Ramirez
;4:
;5: This file is part of Tremulous.
;6:
;7: Tremulous is free software; you can redistribute it
;8: and/or modify it under the terms of the GNU General Public License as
;9: published by the Free Software Foundation; either version 2 of the License,
;10: or (at your option) any later version.
;11:
;12: Tremulous is distributed in the hope that it will be
;13: useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;14: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;15: GNU General Public License for more details.
;16:
;17: You should have received a copy of the GNU General Public License
;18: along with Tremulous; if not, write to the Free Software
;19: Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20: ===========================================================================
;21: */
;22:
;23:#include "g_local.h"
;24:
;25:void G_globalInit()
;26:{
line 28
;27:	char data[255];
;28:	global_t *temp = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 29
;29:	whitelist_t *whitelisttemp = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 31
;30:
;31:	level.globals = NULL;
ADDRGP4 level+190020
CNSTP4 0
ASGNP4
line 32
;32:	level.whitelist = NULL;
ADDRGP4 level+190024
CNSTP4 0
ASGNP4
line 34
;33:
;34:	if (trap_mysql_runquery(va("SELECT HIGH_PRIORITY * FROM globals ORDER BY id ASC")) == qtrue)
ADDRGP4 $89
ARGP4
ADDRLP4 264
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 264
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 1
NEI4 $87
line 35
;35:	{
ADDRGP4 $91
JUMPV
LABELV $90
line 37
;36:		while (trap_mysql_fetchrow() == qtrue)
;37:		{
line 38
;38:			temp = G_Alloc(sizeof(global_t));
CNSTI4 1176
ARGI4
ADDRLP4 272
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 272
INDIRP4
ASGNP4
line 40
;39:
;40:			trap_mysql_fetchfieldbyName("id", data, sizeof(data));
ADDRGP4 $93
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 41
;41:			temp->id = atoi(data);
ADDRLP4 8
ARGP4
ADDRLP4 276
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 276
INDIRI4
ASGNI4
line 42
;42:			trap_mysql_fetchfieldbyName("adminname", temp->adminName, sizeof(temp->adminName));
ADDRGP4 $94
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1113
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 43
;43:			trap_mysql_fetchfieldbyName("ip", temp->ip, sizeof(temp->ip));
ADDRGP4 $95
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 37
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 44
;44:			trap_mysql_fetchfieldbyName("guid", temp->guid, sizeof(temp->guid));
ADDRGP4 $96
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 45
;45:			trap_mysql_fetchfieldbyName("name", temp->playerName, sizeof(temp->playerName));
ADDRGP4 $97
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1077
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 46
;46:			trap_mysql_fetchfieldbyName("reason", temp->reason, sizeof(temp->reason));
ADDRGP4 $98
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 53
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 47
;47:			trap_mysql_fetchfieldbyName("server", temp->server, sizeof(temp->server));
ADDRGP4 $99
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1168
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 48
;48:			trap_mysql_fetchfieldbyName("subnet", data, sizeof(data));
ADDRGP4 $100
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 49
;49:			temp->subnet = atoi(data);
ADDRLP4 8
ARGP4
ADDRLP4 280
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1160
ADDP4
ADDRLP4 280
INDIRI4
ASGNI4
line 50
;50:			trap_mysql_fetchfieldbyName("type", data, sizeof(data));
ADDRGP4 $101
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 51
;51:			temp->type = atoi(data);
ADDRLP4 8
ARGP4
ADDRLP4 284
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1164
ADDP4
ADDRLP4 284
INDIRI4
ASGNI4
line 53
;52:
;53:			temp->next = level.globals;
ADDRLP4 0
INDIRP4
CNSTI4 1172
ADDP4
ADDRGP4 level+190020
INDIRP4
ASGNP4
line 54
;54:			level.globals = temp;
ADDRGP4 level+190020
ADDRLP4 0
INDIRP4
ASGNP4
line 55
;55:		}
LABELV $91
line 36
ADDRLP4 272
ADDRGP4 trap_mysql_fetchrow
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 1
EQI4 $90
line 56
;56:		trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 57
;57:	}
ADDRGP4 $88
JUMPV
LABELV $87
line 59
;58:	else
;59:	{
line 60
;60:		G_LogPrintf("Query Failed on GlobalInit, data base is probably disconnected, try !reconnectdb\n");
ADDRGP4 $104
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 61
;61:	}
LABELV $88
line 63
;62:
;63:	if (trap_mysql_runquery(va("SELECT HIGH_PRIORITY * FROM whitelist ORDER BY id ASC")) == qtrue)
ADDRGP4 $107
ARGP4
ADDRLP4 272
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 272
INDIRP4
ARGP4
ADDRLP4 276
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 1
NEI4 $105
line 64
;64:	{
ADDRGP4 $109
JUMPV
LABELV $108
line 66
;65:		while (trap_mysql_fetchrow() == qtrue)
;66:		{
line 67
;67:			whitelisttemp = G_Alloc(sizeof(whitelist_t));
CNSTI4 1156
ARGI4
ADDRLP4 280
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 280
INDIRP4
ASGNP4
line 69
;68:
;69:			trap_mysql_fetchfieldbyName("id", data, sizeof(data));
ADDRGP4 $93
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 70
;70:			whitelisttemp->id = atoi(data);
ADDRLP4 8
ARGP4
ADDRLP4 284
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 284
INDIRI4
ASGNI4
line 71
;71:			trap_mysql_fetchfieldbyName("adminname", whitelisttemp->adminName, sizeof(whitelisttemp->adminName));
ADDRGP4 $94
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1113
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 72
;72:			trap_mysql_fetchfieldbyName("ip", whitelisttemp->ip, sizeof(whitelisttemp->ip));
ADDRGP4 $95
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 37
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 73
;73:			trap_mysql_fetchfieldbyName("guid", whitelisttemp->guid, sizeof(whitelisttemp->guid));
ADDRGP4 $96
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 74
;74:			trap_mysql_fetchfieldbyName("playername", whitelisttemp->playerName, sizeof(whitelisttemp->playerName));
ADDRGP4 $111
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1077
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 75
;75:			trap_mysql_fetchfieldbyName("reason", whitelisttemp->reason, sizeof(whitelisttemp->reason));
ADDRGP4 $98
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 53
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 77
;76:
;77:			whitelisttemp->next = level.whitelist;
ADDRLP4 4
INDIRP4
CNSTI4 1152
ADDP4
ADDRGP4 level+190024
INDIRP4
ASGNP4
line 78
;78:			level.whitelist = whitelisttemp;
ADDRGP4 level+190024
ADDRLP4 4
INDIRP4
ASGNP4
line 79
;79:		}
LABELV $109
line 65
ADDRLP4 280
ADDRGP4 trap_mysql_fetchrow
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 1
EQI4 $108
line 80
;80:		trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 81
;81:	}
LABELV $105
line 83
;82:
;83:}
LABELV $84
endproc G_globalInit 288 12
export G_globalExit
proc G_globalExit 12 4
line 86
;84:
;85:void G_globalExit(void)
;86:{
line 87
;87:	global_t *temp = level.globals;
ADDRLP4 0
ADDRGP4 level+190020
INDIRP4
ASGNP4
line 88
;88:	whitelist_t *whitelist = level.whitelist;
ADDRLP4 4
ADDRGP4 level+190024
INDIRP4
ASGNP4
ADDRGP4 $118
JUMPV
LABELV $117
line 91
;89:
;90:	while (temp != NULL)
;91:	{
line 92
;92:		global_t *temp2 = temp->next;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 1172
ADDP4
INDIRP4
ASGNP4
line 93
;93:		G_Free(temp);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Free
CALLV
pop
line 94
;94:		temp = temp2;
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 95
;95:	}
LABELV $118
line 90
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $117
ADDRGP4 $121
JUMPV
LABELV $120
line 98
;96:
;97:	while (whitelist != NULL)
;98:	{
line 99
;99:		whitelist_t *whitelist2 = whitelist->next;
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 1152
ADDP4
INDIRP4
ASGNP4
line 100
;100:		G_Free(whitelist);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_Free
CALLV
pop
line 101
;101:		whitelist = whitelist2;
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 102
;102:	}
LABELV $121
line 97
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $120
line 103
;103:}
LABELV $114
endproc G_globalExit 12 4
export G_guidGlobalMatch
proc G_guidGlobalMatch 16 8
line 106
;104:
;105:qboolean G_guidGlobalMatch(char *guid, char *guid2)
;106:{
line 107
;107:	if (Q_stricmp(guid, "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") == 0
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $126
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $127
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $126
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $124
LABELV $127
line 109
;108:			|| Q_stricmp(guid2, "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") == 0)
;109:	{
line 110
;110:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $123
JUMPV
LABELV $124
line 113
;111:	}
;112:
;113:	return (Q_stricmp(guid, guid2) == 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $129
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $130
JUMPV
LABELV $129
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $130
ADDRLP4 8
INDIRI4
RETI4
LABELV $123
endproc G_guidGlobalMatch 16 8
export G_applyGlobal
proc G_applyGlobal 24 16
line 116
;114:}
;115:void G_applyGlobal(gentity_t *ent, global_t *global)
;116:{
line 117
;117:	switch (global->type)
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 1164
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $132
ADDRLP4 0
INDIRI4
CNSTI4 5
GTI4 $132
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $141
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $141
address $133
address $138
address $135
address $136
address $137
address $133
code
line 118
;118:	{
LABELV $135
line 120
;119:		case GLOBAL_DENYBUILD:
;120:			ent->client->pers.denyBuild = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 996
ADDP4
CNSTI4 1
ASGNI4
line 121
;121:			break;
ADDRGP4 $133
JUMPV
LABELV $136
line 124
;122:
;123:		case GLOBAL_FORCESPEC:
;124:			ent->client->pers.forcespec = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 984
ADDP4
CNSTI4 1
ASGNI4
line 125
;125:			break;
ADDRGP4 $133
JUMPV
LABELV $137
line 128
;126:
;127:		case GLOBAL_HANDICAP:
;128:			ent->client->pers.handicap = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 1
ASGNI4
line 129
;129:			break;
ADDRGP4 $133
JUMPV
LABELV $138
line 132
;130:
;131:		case GLOBAL_MUTE:
;132:			ent->client->pers.muted = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 1
ASGNI4
line 133
;133:			break;
line 136
;134:		case GLOBAL_NONE:
;135:			//huh
;136:			break;
line 139
;137:		case GLOBAL_BAN:
;138:			//huh
;139:			break;
LABELV $132
LABELV $133
line 142
;140:	}
;141:
;142:	ent->client->pers.globalID = global->id;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 980
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 144
;143:
;144:	G_AdminsPrintf("^3%s:^7 have been caught by global %s id: %d \n",
ADDRFP4 4
INDIRP4
CNSTI4 1164
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 getGlobalTypeString
CALLP4
ASGNP4
ADDRGP4 $142
ARGP4
ADDRLP4 12
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRGP4 G_AdminsPrintf
CALLV
pop
line 152
;145:		ent->client->pers.netname,
;146:		getGlobalTypeString(global->type),
;147:		global->id);
;148:
;149://	G_LogPrintf("^3%s:^7 have been caught by global %s\n", ent->client->pers.netname,
;150://		getGlobalTypeString(global->type));
;151:
;152:	trap_SendServerCommand(ent->client->ps.clientNum,
ADDRFP4 4
INDIRP4
CNSTI4 1164
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 getGlobalTypeString
CALLP4
ASGNP4
ADDRGP4 $143
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $144
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 157
;153:		va( "print \"^1You have been caught by global %s id: %d appeals: %s\n\"",
;154:		getGlobalTypeString(global->type),
;155:		global->id,
;156:		GLOBALS_URL));
;157:}
LABELV $131
endproc G_applyGlobal 24 16
export G_ipGlobalMatch
proc G_ipGlobalMatch 12 0
line 160
;158:
;159:qboolean G_ipGlobalMatch(char *ip, char *ip2, qboolean subnet)
;160:{
line 161
;161:	int ipPosition = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 164
;162:	int i;
;163:
;164:	for (i = 0; ip[i] != '\0'; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $149
JUMPV
LABELV $146
line 165
;165:	{
line 167
;166:		//3 first blocks match = /24
;167:		if (ipPosition == 4 && subnet == 2)
ADDRLP4 4
INDIRI4
CNSTI4 4
NEI4 $150
ADDRFP4 8
INDIRI4
CNSTI4 2
NEI4 $150
line 168
;168:		{
line 169
;169:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $150
line 172
;170:		}
;171:		//First two blocks match = subnet
;172:		if (ipPosition == 3 && subnet == 1)
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $152
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $152
line 173
;173:		{
line 174
;174:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $152
line 176
;175:		}
;176:		if (ip[i] == '.')
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $154
line 177
;177:		{
line 178
;178:			ipPosition++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 179
;179:			continue;
ADDRGP4 $147
JUMPV
LABELV $154
line 181
;180:		}
;181:		if (ip[i] != ip2[i])
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
EQI4 $156
line 182
;182:		{
line 183
;183:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $156
line 185
;184:		}
;185:	}
LABELV $147
line 164
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $149
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $146
line 187
;186:
;187:	if(ip[0] == '\0' || ip2[0] == '\0')
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
EQI4 $160
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 8
INDIRI4
NEI4 $158
LABELV $160
line 188
;188:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $158
line 190
;189:
;190:	return qtrue;
CNSTI4 1
RETI4
LABELV $145
endproc G_ipGlobalMatch 12 0
export G_globalAdd
proc G_globalAdd 412 40
line 194
;191:}
;192:
;193:int G_globalAdd(gentity_t *adminEnt, gentity_t *victimEnt, char *guid, char *ip, char *playerName, char *reason, int subnet, char *date, globalType_t type)
;194:{
line 195
;195:	global_t *temp = G_Alloc(sizeof(global_t));
CNSTI4 1176
ARGI4
ADDRLP4 336
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 336
INDIRP4
ASGNP4
line 202
;196:	char newDate[11];
;197:	char newPlayerName[MAX_NAME_LENGTH];
;198:	char newGuid[33];
;199:	char data[255];
;200:
;201:	//DATE
;202:	if (date == NULL)
ADDRFP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $162
line 203
;203:	{
line 206
;204:		qtime_t qt;
;205:		int t;
;206:		t = trap_RealTime(&qt);
ADDRLP4 340
ARGP4
ADDRLP4 380
ADDRGP4 trap_RealTime
CALLI4
ASGNI4
ADDRLP4 376
ADDRLP4 380
INDIRI4
ASGNI4
line 208
;207:
;208:		Q_strncpyz(newDate, va("%04i-%02i-%02i", qt.tm_year + 1900, qt.tm_mon
ADDRGP4 $164
ARGP4
ADDRLP4 340+20
INDIRI4
CNSTI4 1900
ADDI4
ARGI4
ADDRLP4 340+16
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 340+12
INDIRI4
ARGI4
ADDRLP4 384
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 69
ARGP4
ADDRLP4 384
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 210
;209:				+ 1, qt.tm_mday), 11);
;210:	}
ADDRGP4 $163
JUMPV
LABELV $162
line 212
;211:	else
;212:	{
line 213
;213:		Q_strncpyz(newDate, date, 11);
ADDRLP4 69
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
CNSTI4 11
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 214
;214:	}
LABELV $163
line 217
;215:
;216:	//PLAYERNAME
;217:	if (playerName == NULL)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $168
line 218
;218:	{
line 219
;219:		Q_strncpyz(newPlayerName, va("%s", "UnnamedPlayer"), MAX_NAME_LENGTH);
ADDRGP4 $170
ARGP4
ADDRGP4 $171
ARGP4
ADDRLP4 340
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 340
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 220
;220:	}
ADDRGP4 $169
JUMPV
LABELV $168
line 222
;221:	else
;222:	{
line 223
;223:		Q_strncpyz(newPlayerName, playerName, MAX_NAME_LENGTH);
ADDRLP4 4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 224
;224:	}
LABELV $169
line 227
;225:
;226:	//GUID
;227:	if (guid == NULL)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $172
line 228
;228:	{
line 229
;229:		Q_strncpyz(newGuid, va("%s", "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"), 33);
ADDRGP4 $170
ARGP4
ADDRGP4 $126
ARGP4
ADDRLP4 340
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 36
ARGP4
ADDRLP4 340
INDIRP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 230
;230:	}
ADDRGP4 $173
JUMPV
LABELV $172
line 232
;231:	else
;232:	{
line 233
;233:		Q_strncpyz(newGuid, guid, 33);
ADDRLP4 36
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 234
;234:	}
LABELV $173
line 237
;235:
;236:	//Setting
;237:	Q_strncpyz(temp->guid, newGuid, 33);
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 238
;238:	Q_strncpyz(temp->ip, ip, 16);
ADDRLP4 0
INDIRP4
CNSTI4 37
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 239
;239:	Q_strncpyz(temp->playerName, newPlayerName, MAX_NAME_LENGTH);
ADDRLP4 0
INDIRP4
CNSTI4 1077
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 240
;240:	Q_strncpyz(temp->server, va("%s","z"), 2);
ADDRGP4 $170
ARGP4
ADDRGP4 $174
ARGP4
ADDRLP4 340
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 1168
ADDP4
ARGP4
ADDRLP4 340
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 241
;241:	Q_strncpyz(temp->adminName, (G_isPlayerConnected(adminEnt))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 348
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
EQI4 $177
ADDRLP4 352
CNSTI4 516
ASGNI4
ADDRLP4 344
ADDRFP4 0
INDIRP4
ADDRLP4 352
INDIRI4
ADDP4
INDIRP4
ADDRLP4 352
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $178
JUMPV
LABELV $177
ADDRLP4 344
ADDRGP4 $175
ASGNP4
LABELV $178
ADDRLP4 0
INDIRP4
CNSTI4 1113
ADDP4
ARGP4
ADDRLP4 344
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 244
;242:			? adminEnt->client->pers.netname
;243:			: "console", MAX_NAME_LENGTH);
;244:	Q_strncpyz(temp->reason, reason, MAX_STRING_CHARS);
ADDRLP4 0
INDIRP4
CNSTI4 53
ADDP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 246
;245:
;246:	temp->subnet = subnet;
ADDRLP4 0
INDIRP4
CNSTI4 1160
ADDP4
ADDRFP4 24
INDIRI4
ASGNI4
line 247
;247:	temp->type = type;
ADDRLP4 0
INDIRP4
CNSTI4 1164
ADDP4
ADDRFP4 32
INDIRI4
ASGNI4
line 249
;248:
;249:	if (trap_mysql_runquery(va("INSERT HIGH_PRIORITY INTO globals"
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 368
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $185
ADDRLP4 356
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $186
JUMPV
LABELV $185
ADDRLP4 356
CNSTI4 -1
ASGNI4
LABELV $186
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 372
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 0
EQI4 $187
ADDRLP4 360
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $188
JUMPV
LABELV $187
ADDRLP4 360
CNSTI4 -1
ASGNI4
LABELV $188
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 376
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 376
INDIRI4
CNSTI4 0
EQI4 $189
ADDRLP4 380
CNSTI4 516
ASGNI4
ADDRLP4 364
ADDRFP4 0
INDIRP4
ADDRLP4 380
INDIRI4
ADDP4
INDIRP4
ADDRLP4 380
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $190
JUMPV
LABELV $189
ADDRLP4 364
ADDRGP4 $175
ASGNP4
LABELV $190
ADDRGP4 $181
ARGP4
ADDRLP4 356
INDIRI4
ARGI4
ADDRLP4 360
INDIRI4
ARGI4
ADDRLP4 364
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 37
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1077
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 53
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1160
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 1164
ADDP4
INDIRI4
ARGI4
ADDRLP4 388
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 388
INDIRP4
ARGP4
ADDRLP4 392
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 392
INDIRI4
CNSTI4 1
NEI4 $179
line 259
;250:		" (playerid,adminid,adminname,ip,guid,name,reason,subnet,type,server) "
;251:		" VALUES (\"%d\",\"%d\",\"%s\",\"%s\",\"%s\",\"%s\",\"%s\",\"%d\",\"%d\",\"z\") ", (G_isPlayerConnected(victimEnt)
;252:			? victimEnt->client->pers.mysqlid
;253:			: -1), (G_isPlayerConnected(adminEnt)
;254:			? adminEnt->client->pers.mysqlid
;255:			: -1), (G_isPlayerConnected(adminEnt)
;256:			? adminEnt->client->pers.netname
;257:			: "console"), temp->ip, temp->guid, temp->playerName, temp->reason, temp->subnet, temp->type))
;258:			== qtrue)
;259:	{
line 260
;260:		trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 261
;261:		if (trap_mysql_runquery(va("SELECT HIGH_PRIORITY id FROM globals ORDER BY id DESC LIMIT 1"))
ADDRGP4 $193
ARGP4
ADDRLP4 396
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 396
INDIRP4
ARGP4
ADDRLP4 400
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 400
INDIRI4
CNSTI4 1
NEI4 $191
line 263
;262:				== qtrue)
;263:		{
line 264
;264:			if (trap_mysql_fetchrow() == qtrue)
ADDRLP4 404
ADDRGP4 trap_mysql_fetchrow
CALLI4
ASGNI4
ADDRLP4 404
INDIRI4
CNSTI4 1
NEI4 $194
line 265
;265:			{
line 266
;266:				trap_mysql_fetchfieldbyName("id", data, sizeof(data));
ADDRGP4 $93
ARGP4
ADDRLP4 80
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 267
;267:				trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 268
;268:				temp->id = atoi(data);
ADDRLP4 80
ARGP4
ADDRLP4 408
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 408
INDIRI4
ASGNI4
line 269
;269:			}
ADDRGP4 $195
JUMPV
LABELV $194
line 271
;270:			else
;271:			{
line 272
;272:				G_LogPrintf("Couldnt insert global to database\n");//va("Hacked client tried to connect guid: %s ip: %s\n", guid, ip) );
ADDRGP4 $196
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 273
;273:				if (level.globals)
ADDRGP4 level+190020
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $197
line 274
;274:				{
line 275
;275:					temp->id = level.globals->id + 1;
ADDRLP4 0
INDIRP4
ADDRGP4 level+190020
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 276
;276:				}
ADDRGP4 $198
JUMPV
LABELV $197
line 278
;277:				else
;278:				{
line 279
;279:					temp->id = 1;
ADDRLP4 0
INDIRP4
CNSTI4 1
ASGNI4
line 280
;280:				}
LABELV $198
line 281
;281:			}
LABELV $195
line 282
;282:		}
LABELV $191
line 283
;283:	}
LABELV $179
line 286
;284:
;285:
;286:	temp->next = level.globals;
ADDRLP4 0
INDIRP4
CNSTI4 1172
ADDP4
ADDRGP4 level+190020
INDIRP4
ASGNP4
line 287
;287:	level.globals = temp;
ADDRGP4 level+190020
ADDRLP4 0
INDIRP4
ASGNP4
line 289
;288:
;289:	return temp->id;
ADDRLP4 0
INDIRP4
INDIRI4
RETI4
LABELV $161
endproc G_globalAdd 412 40
data
align 1
LABELV $204
byte 1 0
skip 15
align 4
LABELV $205
byte 4 0
export G_globalBanCheck
code
proc G_globalBanCheck 116 24
line 292
;290:}
;291:qboolean G_globalBanCheck(char *userinfo, char *reason, int rlen)
;292:{
line 296
;293:	static char lastConnectIP[16] =
;294:	{ "" };
;295:	static int lastConnectTime = 0;
;296:	int t = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
line 297
;297:	global_t *global = level.globals;
ADDRLP4 0
ADDRGP4 level+190020
INDIRP4
ASGNP4
line 298
;298:	qboolean ipMatch = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 299
;299:	qboolean guidMatch = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 305
;300:
;301:	char guid[33];
;302:	char ip[16];
;303:	char *value;
;304:
;305:	*reason = '\0';
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 307
;306:
;307:	if (!*userinfo)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $207
line 308
;308:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $203
JUMPV
LABELV $207
line 310
;309:
;310:	value = Info_ValueForKey(userinfo, "ip");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $95
ARGP4
ADDRLP4 72
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 72
INDIRP4
ASGNP4
line 311
;311:	Q_strncpyz(ip, value, sizeof(ip));
ADDRLP4 12
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 313
;312:	// strip port
;313:	value = strchr(ip, ':');
ADDRLP4 12
ARGP4
CNSTI4 58
ARGI4
ADDRLP4 76
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 76
INDIRP4
ASGNP4
line 314
;314:	if (value)
ADDRLP4 68
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $209
line 315
;315:		*value = '\0';
ADDRLP4 68
INDIRP4
CNSTI1 0
ASGNI1
LABELV $209
line 317
;316:
;317:	if (!*ip)
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $211
line 318
;318:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $203
JUMPV
LABELV $211
line 320
;319:
;320:	value = Info_ValueForKey(userinfo, "cl_guid");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $213
ARGP4
ADDRLP4 80
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 80
INDIRP4
ASGNP4
line 322
;321:	
;322:	if (!value[0])
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $214
line 323
;323:	{
line 324
;324:		Q_strncpyz(guid, "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", sizeof(guid));
ADDRLP4 28
ARGP4
ADDRGP4 $126
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 325
;325:	} else {
ADDRGP4 $217
JUMPV
LABELV $214
line 326
;326:	Q_strncpyz(guid, value, sizeof(guid));
ADDRLP4 28
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 327
;327:	}
ADDRGP4 $217
JUMPV
LABELV $216
line 329
;328:	while (global)
;329:	{
line 330
;330:		ipMatch = G_ipGlobalMatch(global->ip, ip, global->subnet);
ADDRLP4 0
INDIRP4
CNSTI4 37
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1160
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 G_ipGlobalMatch
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 88
INDIRI4
ASGNI4
line 331
;331:		guidMatch = G_guidGlobalMatch(guid, global->guid);
ADDRLP4 28
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 92
ADDRGP4 G_guidGlobalMatch
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 92
INDIRI4
ASGNI4
line 333
;332:
;333:		if ((ipMatch != guidMatch)
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $219
ADDRLP4 28
ARGP4
ADDRGP4 $126
ARGP4
ADDRLP4 96
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $219
line 335
;334:				&& Q_stricmp(guid, "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"))
;335:		{
line 338
;336:			//This can cause problems, because if a player is connecting and you delete the global it will recreate again lol..
;337:			//G_globalAdd(guid, ip, global->playerName, global->reason, global->subnet, global->date, global->type);
;338:		}
LABELV $219
line 340
;339:
;340:		if ((ipMatch || guidMatch) && global->type == GLOBAL_BAN)
ADDRLP4 100
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 100
INDIRI4
NEI4 $223
ADDRLP4 8
INDIRI4
ADDRLP4 100
INDIRI4
EQI4 $221
LABELV $223
ADDRLP4 0
INDIRP4
CNSTI4 1164
ADDP4
INDIRI4
CNSTI4 5
NEI4 $221
line 341
;341:		{
line 343
;342:			// flood protected
;343:			if (t - lastConnectTime >= 3000 || Q_stricmp(lastConnectIP, ip))
ADDRLP4 64
INDIRI4
ADDRGP4 $205
INDIRI4
SUBI4
CNSTI4 3000
GEI4 $226
ADDRGP4 $204
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $224
LABELV $226
line 344
;344:			{
line 345
;345:				lastConnectTime = t;
ADDRGP4 $205
ADDRLP4 64
INDIRI4
ASGNI4
line 346
;346:				Q_strncpyz(lastConnectIP, ip, sizeof(lastConnectIP));
ADDRGP4 $204
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 348
;347:
;348:				G_AdminsPrintf("Banned player %s^7 (%s^7) tried to connect (ban #%d reason: %s^7 )\n", global->playerName, Info_ValueForKey(userinfo, "name"), global->id, global->reason);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $97
ARGP4
ADDRLP4 108
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $227
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1077
ADDP4
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 53
ADDP4
ARGP4
ADDRGP4 G_AdminsPrintf
CALLV
pop
line 349
;349:			}
LABELV $224
line 351
;350:
;351:			Com_sprintf(reason, rlen, "^3Ban ID:^7%d ^3Reason: ^7%s ^3Appeal: ^7%s", global->id, global->reason, GLOBALS_URL);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 53
ADDP4
ARGP4
ADDRGP4 $144
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 352
;352:			G_LogPrintf("Banned player tried to connect from IP %s, caught by global #%d\n", ip, global->id);
ADDRGP4 $229
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 353
;353:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $203
JUMPV
LABELV $221
line 355
;354:		}
;355:		global = global->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1172
ADDP4
INDIRP4
ASGNP4
line 356
;356:	}
LABELV $217
line 328
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $216
line 357
;357:	return qfalse;
CNSTI4 0
RETI4
LABELV $203
endproc G_globalBanCheck 116 24
export G_whitelistCheck
proc G_whitelistCheck 32 16
line 360
;358:}
;359:void G_whitelistCheck(gentity_t *ent)
;360:{
line 361
;361:	whitelist_t *whitelist = level.whitelist;
ADDRLP4 0
ADDRGP4 level+190024
INDIRP4
ASGNP4
line 362
;362:	qboolean ipMatch = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 363
;363:	qboolean guidMatch = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $233
JUMPV
LABELV $232
line 366
;364:
;365:	while (whitelist)
;366:	{
line 367
;367:		ipMatch
ADDRLP4 0
INDIRP4
CNSTI4 37
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 729
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 G_ipGlobalMatch
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 369
;368:				= G_ipGlobalMatch(whitelist->ip, ent->client->pers.ip, qfalse);
;369:		guidMatch = G_guidGlobalMatch(ent->client->pers.guid, whitelist->guid);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 G_guidGlobalMatch
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 371
;370:
;371:		if (ipMatch || guidMatch)
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $237
ADDRLP4 8
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $235
LABELV $237
line 372
;372:		{
line 373
;373:			G_AdminsPrintf("%s ^7White listed reason: %s ID: %d\n",
ADDRGP4 $238
ARGP4
ADDRLP4 24
CNSTI4 516
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 53
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 G_AdminsPrintf
CALLV
pop
line 377
;374:					ent->client->pers.netname,
;375:					whitelist->reason,
;376:					whitelist->id);
;377:			ent->client->pers.whiteListed = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 1
ASGNI4
line 378
;378:			return;
ADDRGP4 $230
JUMPV
LABELV $235
line 380
;379:		}
;380:		whitelist = whitelist->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1152
ADDP4
INDIRP4
ASGNP4
line 381
;381:	}
LABELV $233
line 365
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $232
line 382
;382:}
LABELV $230
endproc G_whitelistCheck 32 16
export G_globalCheck
proc G_globalCheck 28 12
line 385
;383://Check everything except ban.
;384:void G_globalCheck(gentity_t *ent)
;385:{
line 386
;386:	global_t *global = level.globals;
ADDRLP4 0
ADDRGP4 level+190020
INDIRP4
ASGNP4
line 387
;387:	qboolean ipMatch = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 388
;388:	qboolean guidMatch = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 390
;389:
;390:	if(ent->client->pers.whiteListed)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
EQI4 $244
line 391
;391:	{
line 392
;392:		return;
ADDRGP4 $239
JUMPV
LABELV $243
line 396
;393:	}
;394:
;395:	while (global)
;396:	{
line 397
;397:		ipMatch
ADDRLP4 0
INDIRP4
CNSTI4 37
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 729
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1160
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 G_ipGlobalMatch
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 399
;398:				= G_ipGlobalMatch(global->ip, ent->client->pers.ip, global->subnet);
;399:		guidMatch = G_guidGlobalMatch(ent->client->pers.guid, global->guid);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 G_guidGlobalMatch
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 401
;400:
;401:		if (ipMatch || guidMatch)
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $248
ADDRLP4 8
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $246
LABELV $248
line 402
;402:		{
line 403
;403:			G_applyGlobal(ent, global);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_applyGlobal
CALLV
pop
line 404
;404:		}
LABELV $246
line 405
;405:		global = global->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1172
ADDP4
INDIRP4
ASGNP4
line 406
;406:	}
LABELV $244
line 395
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $243
line 407
;407:}
LABELV $239
endproc G_globalCheck 28 12
export getGlobalTypeString
proc getGlobalTypeString 12 0
line 409
;408:char *getGlobalTypeString(globalType_t type)
;409:{
line 412
;410:	char *typeReason;
;411:
;412:	switch (type)
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $250
ADDRLP4 4
INDIRI4
CNSTI4 5
GTI4 $250
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $264-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $264
address $259
address $253
address $255
address $257
address $261
code
line 413
;413:	{
LABELV $253
line 415
;414:		case GLOBAL_DENYBUILD:
;415:			typeReason = "DENYBUILD";
ADDRLP4 0
ADDRGP4 $254
ASGNP4
line 416
;416:			break;
ADDRGP4 $251
JUMPV
LABELV $255
line 418
;417:		case GLOBAL_FORCESPEC:
;418:			typeReason = "FORCESPEC";
ADDRLP4 0
ADDRGP4 $256
ASGNP4
line 419
;419:			break;
ADDRGP4 $251
JUMPV
LABELV $257
line 421
;420:		case GLOBAL_HANDICAP:
;421:			typeReason = "HANDYCAP";
ADDRLP4 0
ADDRGP4 $258
ASGNP4
line 422
;422:			break;
ADDRGP4 $251
JUMPV
LABELV $259
line 424
;423:		case GLOBAL_MUTE:
;424:			typeReason = "MUTE";
ADDRLP4 0
ADDRGP4 $260
ASGNP4
line 425
;425:			break;
ADDRGP4 $251
JUMPV
LABELV $261
line 427
;426:		case GLOBAL_BAN:
;427:			typeReason = "BAN";
ADDRLP4 0
ADDRGP4 $262
ASGNP4
line 428
;428:			break;
ADDRGP4 $251
JUMPV
LABELV $250
line 430
;429:		default:
;430:			typeReason = "OTHER";
ADDRLP4 0
ADDRGP4 $263
ASGNP4
line 431
;431:			break;
LABELV $251
line 433
;432:	}
;433:	return typeReason;
ADDRLP4 0
INDIRP4
RETP4
LABELV $249
endproc getGlobalTypeString 12 0
export G_deleteGlobal
proc G_deleteGlobal 16 8
line 436
;434:}
;435:qboolean G_deleteGlobal(int id)
;436:{
line 437
;437:	global_t *global = level.globals;
ADDRLP4 0
ADDRGP4 level+190020
INDIRP4
ASGNP4
line 438
;438:	global_t *lastGlobal = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRGP4 $269
JUMPV
LABELV $268
line 441
;439:
;440:	while (global)
;441:	{
line 442
;442:		if (global->id == id)
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $271
line 443
;443:		{
line 444
;444:			if (lastGlobal == NULL)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $273
line 445
;445:			{
line 446
;446:				level.globals = global->next;
ADDRGP4 level+190020
ADDRLP4 0
INDIRP4
CNSTI4 1172
ADDP4
INDIRP4
ASGNP4
line 447
;447:			}
ADDRGP4 $274
JUMPV
LABELV $273
line 449
;448:			else
;449:			{
line 450
;450:				lastGlobal->next = global->next;
ADDRLP4 8
CNSTI4 1172
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 451
;451:			}
LABELV $274
line 452
;452:			if (trap_mysql_runquery(va("DELETE QUICK FROM globals WHERE id = %d LIMIT 1", id))
ADDRGP4 $278
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
NEI4 $276
line 454
;453:					== qtrue)
;454:			{
line 455
;455:				trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 456
;456:				G_Free(global);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Free
CALLV
pop
line 457
;457:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $266
JUMPV
LABELV $276
line 460
;458:			}
;459:			else
;460:			{
line 461
;461:				G_AdminsPrintf("Cant delete %d from database, try !reconnectdb then !gsync\n", id);
ADDRGP4 $279
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_AdminsPrintf
CALLV
pop
line 462
;462:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $266
JUMPV
LABELV $271
line 465
;463:			}
;464:		}
;465:		lastGlobal = global;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 466
;466:		global = global->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1172
ADDP4
INDIRP4
ASGNP4
line 467
;467:	}
LABELV $269
line 440
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $268
line 468
;468:	return qfalse;
CNSTI4 0
RETI4
LABELV $266
endproc G_deleteGlobal 16 8
export G_deleteWhite
proc G_deleteWhite 16 8
line 471
;469:}
;470:qboolean G_deleteWhite(int id)
;471:{
line 472
;472:	whitelist_t *whitelist = level.whitelist;
ADDRLP4 0
ADDRGP4 level+190024
INDIRP4
ASGNP4
line 473
;473:	whitelist_t *lastWhitelist = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRGP4 $283
JUMPV
LABELV $282
line 476
;474:
;475:	while (whitelist)
;476:	{
line 477
;477:		if (whitelist->id == id)
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $285
line 478
;478:		{
line 479
;479:			if (lastWhitelist == NULL)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $287
line 480
;480:			{
line 481
;481:				level.whitelist = whitelist->next;
ADDRGP4 level+190024
ADDRLP4 0
INDIRP4
CNSTI4 1152
ADDP4
INDIRP4
ASGNP4
line 482
;482:			}
ADDRGP4 $288
JUMPV
LABELV $287
line 484
;483:			else
;484:			{
line 485
;485:				lastWhitelist->next = whitelist->next;
ADDRLP4 8
CNSTI4 1152
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 486
;486:			}
LABELV $288
line 487
;487:			if (trap_mysql_runquery(va("DELETE QUICK FROM whitelist WHERE id = %d LIMIT 1", id))
ADDRGP4 $292
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
NEI4 $290
line 489
;488:					== qtrue)
;489:			{
line 490
;490:				trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 491
;491:				G_Free(whitelist);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Free
CALLV
pop
line 492
;492:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $280
JUMPV
LABELV $290
line 495
;493:			}
;494:			else
;495:			{
line 496
;496:				G_AdminsPrintf("Cant delete %d from database, try !reconnectdb then !gsync\n",id);
ADDRGP4 $279
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_AdminsPrintf
CALLV
pop
line 497
;497:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $280
JUMPV
LABELV $285
line 501
;498:			}
;499:
;500:		}
;501:		lastWhitelist = whitelist;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 502
;502:		whitelist = whitelist->next;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1152
ADDP4
INDIRP4
ASGNP4
line 503
;503:	}
LABELV $283
line 475
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $282
line 504
;504:	return qfalse;
CNSTI4 0
RETI4
LABELV $280
endproc G_deleteWhite 16 8
export G_adminGlobalSetReason
proc G_adminGlobalSetReason 4 16
line 507
;505:}
;506:void G_adminGlobalSetReason(int skiparg, qboolean subnet, char *reason, int rlen)
;507:{
line 508
;508:	if (subnet)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $294
line 509
;509:	{
line 510
;510:		Com_sprintf(reason, rlen, "%s", G_SayConcatArgs(3 + skiparg));
ADDRFP4 0
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRLP4 0
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 $170
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 511
;511:	}
ADDRGP4 $295
JUMPV
LABELV $294
line 513
;512:	else
;513:	{
line 514
;514:		Com_sprintf(reason, rlen, "%s", G_SayConcatArgs(2 + skiparg));
ADDRFP4 0
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 0
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 $170
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 515
;515:	}
LABELV $295
line 516
;516:}
LABELV $293
endproc G_adminGlobalSetReason 4 16
export G_matchSlot
proc G_matchSlot 24 4
line 518
;517:int G_matchSlot(char *who)
;518:{
line 520
;519:	gentity_t *ent;
;520:	ent = &g_entities[atoi(who)];
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
CNSTI4 2476
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 521
;521:	if (ent && ent->client && ent->client->pers.connected == CON_CONNECTED)
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $297
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $297
ADDRLP4 16
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 2
NEI4 $297
line 522
;522:	{
line 523
;523:		return atoi(who);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $296
JUMPV
LABELV $297
line 525
;524:	}
;525:	return -1;
CNSTI4 -1
RETI4
LABELV $296
endproc G_matchSlot 24 4
export G_adminGlobalSetSlot
proc G_adminGlobalSetSlot 8 4
line 528
;526:}
;527:int G_adminGlobalSetSlot(char *who)
;528:{
line 529
;529:	int logmatch = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 531
;530:
;531:	logmatch = G_matchSlot(who);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_matchSlot
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 537
;532:	//G_Printf("%d\n", logmatch);
;533:	//	if (logmatch == -1)
;534:	//	{
;535:	//		logmatch = G_matchName(who);
;536:	//	}
;537:	return logmatch;
ADDRLP4 0
INDIRI4
RETI4
LABELV $299
endproc G_adminGlobalSetSlot 8 4
export G_adminGlobalSetWho
proc G_adminGlobalSetWho 4 12
line 540
;538:}
;539:void G_adminGlobalSetWho(char *who, int skiparg)
;540:{
line 541
;541:	G_SayArgv(1 + skiparg, who, MAX_STRING_CHARS);
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 542
;542:	G_SanitiseString(who, who, MAX_STRING_CHARS);
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
CNSTI4 1024
ARGI4
ADDRGP4 G_SanitiseString
CALLV
pop
line 543
;543:}
LABELV $300
endproc G_adminGlobalSetWho 4 12
export G_adminGlobalSetSubnet
proc G_adminGlobalSetSubnet 44 12
line 545
;544:int G_adminGlobalSetSubnet(int skiparg)
;545:{
line 548
;546:	char subnet[MAX_NAME_LENGTH];\
;547:	int i;
;548:	G_SayArgv(2 + skiparg, subnet, sizeof(subnet));
ADDRFP4 0
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
line 550
;549:
;550:	for(i=0;subnet[i] != '\0';i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $305
JUMPV
LABELV $302
line 551
;551:	{
line 552
;552:		if( subnet[ i ] < '0' || subnet[ i ] > '9' )
ADDRLP4 36
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 48
LTI4 $308
ADDRLP4 36
INDIRI4
CNSTI4 57
LEI4 $306
LABELV $308
line 553
;553:		{
line 554
;554:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $301
JUMPV
LABELV $306
line 556
;555:		}
;556:	}
LABELV $303
line 550
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $305
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $302
line 557
;557:	if(atoi(subnet)>9) return 0;
ADDRLP4 4
ARGP4
ADDRLP4 36
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 9
LEI4 $309
CNSTI4 0
RETI4
ADDRGP4 $301
JUMPV
LABELV $309
line 558
;558:	return atoi(subnet);
ADDRLP4 4
ARGP4
ADDRLP4 40
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
LABELV $301
endproc G_adminGlobalSetSubnet 44 12
export G_globalPrintMsgForAdmins
proc G_globalPrintMsgForAdmins 2112 28
line 561
;559:}
;560:void G_globalPrintMsgForAdmins(gentity_t *ent, gentity_t *vic, int type, globalType_t globalID, char *who, char *reason)
;561:{
line 564
;562:	char command[MAX_STRING_CHARS];
;563:	char action[MAX_STRING_CHARS];
;564:	switch (type)
ADDRLP4 2048
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 2048
INDIRI4
CNSTI4 1
LTI4 $312
ADDRLP4 2048
INDIRI4
CNSTI4 5
GTI4 $312
ADDRLP4 2048
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $329-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $329
address $326
address $317
address $320
address $323
address $314
code
line 565
;565:	{
LABELV $314
line 567
;566:		case GLOBAL_BAN:
;567:			Com_sprintf(command, sizeof(command), "%s", "!gban");
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $170
ARGP4
ADDRGP4 $315
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 568
;568:			Com_sprintf(action, sizeof(action), "%s", "as been banned by");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $170
ARGP4
ADDRGP4 $316
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 569
;569:			break;
ADDRGP4 $313
JUMPV
LABELV $317
line 571
;570:		case GLOBAL_DENYBUILD:
;571:			Com_sprintf(command, sizeof(command), "%s", "!gdenybuild");
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $170
ARGP4
ADDRGP4 $318
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 572
;572:			Com_sprintf(action, sizeof(action), "%s", "as lost building rights by");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $170
ARGP4
ADDRGP4 $319
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 573
;573:			break;
ADDRGP4 $313
JUMPV
LABELV $320
line 575
;574:		case GLOBAL_FORCESPEC:
;575:			Com_sprintf(command, sizeof(command), "%s", "!gforcespec");
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $170
ARGP4
ADDRGP4 $321
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 576
;576:			Com_sprintf(action, sizeof(action), "%s", "as been forced to spec by");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $170
ARGP4
ADDRGP4 $322
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 577
;577:			break;
ADDRGP4 $313
JUMPV
LABELV $323
line 579
;578:		case GLOBAL_HANDICAP:
;579:			Com_sprintf(command, sizeof(command), "%s", "!ghandicap");
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $170
ARGP4
ADDRGP4 $324
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 580
;580:			Com_sprintf(action, sizeof(action), "%s", "as been handicaped by");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $170
ARGP4
ADDRGP4 $325
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 581
;581:			break;
ADDRGP4 $313
JUMPV
LABELV $326
line 583
;582:		case GLOBAL_MUTE:
;583:			Com_sprintf(command, sizeof(command), "%s", "!gmute");
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $170
ARGP4
ADDRGP4 $327
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 584
;584:			Com_sprintf(action, sizeof(action), "%s", "as been muted by");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $170
ARGP4
ADDRGP4 $328
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 585
;585:			break;
LABELV $312
LABELV $313
line 587
;586:	}
;587:	AP( va( "print \"^3%s:^7 %s %s %s reason: %s ^3ID:^7#%d \n\"",
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2064
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 0
EQI4 $336
ADDRLP4 2068
CNSTI4 516
ASGNI4
ADDRLP4 2052
ADDRFP4 4
INDIRP4
ADDRLP4 2068
INDIRI4
ADDP4
INDIRP4
ADDRLP4 2068
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $337
JUMPV
LABELV $336
ADDRLP4 2052
ADDRFP4 16
INDIRP4
ASGNP4
LABELV $337
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2072
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
EQI4 $338
ADDRLP4 2076
CNSTI4 516
ASGNI4
ADDRLP4 2056
ADDRFP4 0
INDIRP4
ADDRLP4 2076
INDIRI4
ADDP4
INDIRP4
ADDRLP4 2076
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $339
JUMPV
LABELV $338
ADDRLP4 2056
ADDRGP4 $175
ASGNP4
LABELV $339
ADDRGP4 $331
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 2052
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 2056
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $340
ADDRLP4 2060
ADDRFP4 20
INDIRP4
ASGNP4
ADDRGP4 $341
JUMPV
LABELV $340
ADDRLP4 2060
ADDRGP4 $334
ASGNP4
LABELV $341
ADDRLP4 2060
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 2080
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2080
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 594
;588:					command,
;589:					(G_isPlayerConnected(vic)) ? vic->client->pers.netname : who,
;590:					action,
;591:					(G_isPlayerConnected(ent)) ? ent->client->pers.netname : "console",
;592:					( *reason ) ? reason : "not specified",
;593:					globalID) );
;594:	G_LogPrintf("%s %s %s reason: %s, ID: #%d\n", (G_isPlayerConnected(vic))
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2096
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 0
EQI4 $346
ADDRLP4 2100
CNSTI4 516
ASGNI4
ADDRLP4 2084
ADDRFP4 4
INDIRP4
ADDRLP4 2100
INDIRI4
ADDP4
INDIRP4
ADDRLP4 2100
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $347
JUMPV
LABELV $346
ADDRLP4 2084
ADDRFP4 16
INDIRP4
ASGNP4
LABELV $347
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2104
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 0
EQI4 $348
ADDRLP4 2108
CNSTI4 516
ASGNI4
ADDRLP4 2088
ADDRFP4 0
INDIRP4
ADDRLP4 2108
INDIRI4
ADDP4
INDIRP4
ADDRLP4 2108
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $349
JUMPV
LABELV $348
ADDRLP4 2088
ADDRGP4 $175
ASGNP4
LABELV $349
ADDRGP4 $342
ARGP4
ADDRLP4 2084
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 2088
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $350
ADDRLP4 2092
ADDRFP4 20
INDIRP4
ASGNP4
ADDRGP4 $351
JUMPV
LABELV $350
ADDRLP4 2092
ADDRGP4 $334
ASGNP4
LABELV $351
ADDRLP4 2092
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 599
;595:			? vic->client->pers.netname
;596:			: who, action, (G_isPlayerConnected(ent))
;597:			? ent->client->pers.netname
;598:			: "console", (*reason) ? reason : "not specified", globalID);
;599:}
LABELV $311
endproc G_globalPrintMsgForAdmins 2112 28
export G_globalPrintMsgForPlayer
proc G_globalPrintMsgForPlayer 1056 20
line 601
;600:void G_globalPrintMsgForPlayer(gentity_t *ent, gentity_t *vic, globalType_t type, int globalID, char *reason)
;601:{
line 603
;602:	char action[MAX_STRING_CHARS];
;603:	if (!G_isPlayerConnected(vic))
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1024
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
NEI4 $353
line 604
;604:	{
line 605
;605:		return;
ADDRGP4 $352
JUMPV
LABELV $353
line 607
;606:	}
;607:	switch (type)
ADDRLP4 1028
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
LTI4 $355
ADDRLP4 1028
INDIRI4
CNSTI4 5
GTI4 $355
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $369
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $369
address $356
address $366
address $360
address $362
address $364
address $358
code
line 608
;608:	{
LABELV $358
line 610
;609:		case GLOBAL_BAN:
;610:			Com_sprintf(action, sizeof(action), "%s", "You have been banned by");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $170
ARGP4
ADDRGP4 $359
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 611
;611:			break;
ADDRGP4 $356
JUMPV
LABELV $360
line 613
;612:		case GLOBAL_DENYBUILD:
;613:			Com_sprintf(action, sizeof(action), "%s", "You have been denybuild by");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $170
ARGP4
ADDRGP4 $361
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 614
;614:			break;
ADDRGP4 $356
JUMPV
LABELV $362
line 616
;615:		case GLOBAL_FORCESPEC:
;616:			Com_sprintf(action, sizeof(action), "%s", "You have been forced to spec by");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $170
ARGP4
ADDRGP4 $363
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 617
;617:			break;
ADDRGP4 $356
JUMPV
LABELV $364
line 619
;618:		case GLOBAL_HANDICAP:
;619:			Com_sprintf(action, sizeof(action), "%s", "You have been handicap by");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $170
ARGP4
ADDRGP4 $365
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 620
;620:			break;
ADDRGP4 $356
JUMPV
LABELV $366
line 622
;621:		case GLOBAL_MUTE:
;622:			Com_sprintf(action, sizeof(action), "%s", "You have been muted by");
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $170
ARGP4
ADDRGP4 $367
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 623
;623:			break;
line 626
;624:		case GLOBAL_NONE:
;625:			//huh?
;626:			break;
LABELV $355
LABELV $356
line 628
;627:	}
;628:	trap_SendServerCommand(vic->client->ps.clientNum, va("print \"^7%s "
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $373
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 G_admin_adminPrintName
CALLP4
ASGNP4
ADDRLP4 1036
ADDRLP4 1048
INDIRP4
ASGNP4
ADDRGP4 $374
JUMPV
LABELV $373
ADDRLP4 1036
ADDRGP4 $175
ASGNP4
LABELV $374
ADDRGP4 $370
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $375
ADDRLP4 1040
ADDRFP4 16
INDIRP4
ASGNP4
ADDRGP4 $376
JUMPV
LABELV $375
ADDRLP4 1040
ADDRGP4 $334
ASGNP4
LABELV $376
ADDRLP4 1040
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 632
;629:		"%s reason: %s ^3ID:^7%d \n\"", action, (G_isPlayerConnected(ent))
;630:			? G_admin_adminPrintName(ent)
;631:			: "console", (*reason) ? reason : "not specified", globalID));
;632:}
LABELV $352
endproc G_globalPrintMsgForPlayer 1056 20
export G_globalAction
proc G_globalAction 28 12
line 634
;633:void G_globalAction(gentity_t *ent, gentity_t *vic, globalType_t type, char *reason)
;634:{
line 635
;635:	if (!G_isPlayerConnected(vic))
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $378
line 636
;636:		return;
ADDRGP4 $377
JUMPV
LABELV $378
line 638
;637:
;638:	switch (type)
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $380
ADDRLP4 4
INDIRI4
CNSTI4 5
GTI4 $380
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $397
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $397
address $381
address $395
address $392
address $393
address $394
address $383
code
line 639
;639:	{
LABELV $383
line 641
;640:		case GLOBAL_BAN:
;641:			trap_DropClient(vic->client->ps.clientNum, va("banned by %s^7, reason: %s", (ent)
ADDRGP4 $384
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $388
ADDRLP4 20
CNSTI4 516
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $389
JUMPV
LABELV $388
ADDRLP4 12
ADDRGP4 $175
ASGNP4
LABELV $389
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $390
ADDRLP4 16
ADDRFP4 12
INDIRP4
ASGNP4
ADDRGP4 $391
JUMPV
LABELV $390
ADDRLP4 16
ADDRGP4 $386
ASGNP4
LABELV $391
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 644
;642:					? ent->client->pers.netname
;643:					: "console", (*reason) ? reason : "banned by admin"));
;644:			break;
ADDRGP4 $381
JUMPV
LABELV $392
line 646
;645:		case GLOBAL_DENYBUILD:
;646:			vic->client->pers.denyBuild = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 996
ADDP4
CNSTI4 1
ASGNI4
line 647
;647:			break;
ADDRGP4 $381
JUMPV
LABELV $393
line 649
;648:		case GLOBAL_FORCESPEC:
;649:			vic->client->pers.forcespec = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 984
ADDP4
CNSTI4 1
ASGNI4
line 650
;650:			break;
ADDRGP4 $381
JUMPV
LABELV $394
line 652
;651:		case GLOBAL_HANDICAP:
;652:			vic->client->pers.handicap = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 1
ASGNI4
line 653
;653:			break;
ADDRGP4 $381
JUMPV
LABELV $395
line 655
;654:		case GLOBAL_MUTE:
;655:			vic->client->pers.muted = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 1
ASGNI4
line 656
;656:			break;
line 659
;657:		case GLOBAL_NONE:
;658:			//uh?
;659:			break;
LABELV $380
LABELV $381
line 661
;660:	}
;661:}
LABELV $377
endproc G_globalAction 28 12
lit
align 1
LABELV $399
byte 1 0
skip 1023
export G_adminGlobal
code
proc G_adminGlobal 2104 36
line 663
;662:qboolean G_adminGlobal(gentity_t *ent, int skiparg, globalType_t type)
;663:{
line 664
;664:	gentity_t *vic = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 667
;665:	char who[MAX_STRING_CHARS];
;666:	char reason[MAX_STRING_CHARS] =
;667:	{ "" };
ADDRLP4 4
ADDRGP4 $399
INDIRB
ASGNB 1024
line 668
;668:	qboolean subnetBan = qfalse;
ADDRLP4 2052
CNSTI4 0
ASGNI4
line 669
;669:	int playerSlot = -1;
ADDRLP4 2056
CNSTI4 -1
ASGNI4
line 670
;670:	int minArguments = 2 + skiparg; //Subnet is optional
ADDRLP4 2064
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 673
;671:	int globalID;
;672:
;673:	if (G_SayArgc() < minArguments)
ADDRLP4 2068
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
ADDRLP4 2064
INDIRI4
GEI4 $400
line 674
;674:	{
line 675
;675:		ADMP( "^3!help: ^7!command\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $402
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 676
;676:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $398
JUMPV
LABELV $400
line 679
;677:	}
;678:
;679:	G_adminGlobalSetWho(who, skiparg);
ADDRLP4 1028
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_adminGlobalSetWho
CALLV
pop
line 680
;680:	subnetBan = G_adminGlobalSetSubnet(skiparg);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 2072
ADDRGP4 G_adminGlobalSetSubnet
CALLI4
ASGNI4
ADDRLP4 2052
ADDRLP4 2072
INDIRI4
ASGNI4
line 681
;681:	G_adminGlobalSetReason(skiparg, subnetBan, reason, sizeof(reason));
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 2052
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 G_adminGlobalSetReason
CALLV
pop
line 684
;682:
;683:	//If isnt a ip check if is a slot, atoi converts ips into ins :(
;684:	if(!G_isValidIpAddress(who))
ADDRLP4 1028
ARGP4
ADDRLP4 2076
ADDRGP4 G_isValidIpAddress
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
NEI4 $403
line 685
;685:		playerSlot = G_adminGlobalSetSlot(who);
ADDRLP4 1028
ARGP4
ADDRLP4 2080
ADDRGP4 G_adminGlobalSetSlot
CALLI4
ASGNI4
ADDRLP4 2056
ADDRLP4 2080
INDIRI4
ASGNI4
LABELV $403
line 687
;686:
;687:	if (playerSlot == -1 && !G_isValidIpAddress(who))
ADDRLP4 2056
INDIRI4
CNSTI4 -1
NEI4 $405
ADDRLP4 1028
ARGP4
ADDRLP4 2084
ADDRGP4 G_isValidIpAddress
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $405
line 688
;688:	{
line 689
;689:		ADMP( "^3No player found by that name, IP, or slot number\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $407
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 690
;690:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $398
JUMPV
LABELV $405
line 692
;691:	}
;692:	if (playerSlot != -1)
ADDRLP4 2056
INDIRI4
CNSTI4 -1
EQI4 $408
line 693
;693:	{
line 694
;694:		vic = &g_entities[playerSlot];
ADDRLP4 0
CNSTI4 2476
ADDRLP4 2056
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 695
;695:		globalID
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2092
CNSTI4 516
ASGNI4
ADDRLP4 2096
ADDRLP4 0
INDIRP4
ADDRLP4 2092
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 2096
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRLP4 2096
INDIRP4
CNSTI4 729
ADDP4
ARGP4
ADDRLP4 2096
INDIRP4
ADDRLP4 2092
INDIRI4
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2052
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 2100
ADDRGP4 G_globalAdd
CALLI4
ASGNI4
ADDRLP4 2060
ADDRLP4 2100
INDIRI4
ASGNI4
line 697
;696:				= G_globalAdd(ent, vic, vic->client->pers.guid, vic->client->pers.ip, vic->client->pers.netname, reason, subnetBan, NULL, type);
;697:	}
ADDRGP4 $409
JUMPV
LABELV $408
line 699
;698:	else
;699:	{
line 700
;700:		globalID
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2088
CNSTP4 0
ASGNP4
ADDRLP4 2088
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 2088
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2052
INDIRI4
ARGI4
ADDRLP4 2088
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 2092
ADDRGP4 G_globalAdd
CALLI4
ASGNI4
ADDRLP4 2060
ADDRLP4 2092
INDIRI4
ASGNI4
line 702
;701:				= G_globalAdd(ent, vic, NULL, who, NULL, reason, subnetBan, NULL, type);
;702:	}
LABELV $409
line 704
;703:
;704:	G_globalPrintMsgForAdmins(ent, vic, type, globalID, who, reason);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 2060
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_globalPrintMsgForAdmins
CALLV
pop
line 705
;705:	G_globalPrintMsgForPlayer(ent, vic, type, globalID, reason);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 2060
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 G_globalPrintMsgForPlayer
CALLV
pop
line 706
;706:	G_globalAction(ent, vic, type, reason);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 G_globalAction
CALLV
pop
line 708
;707:
;708:	if (G_isPlayerConnected(vic))
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2088
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 2088
INDIRI4
CNSTI4 0
EQI4 $410
line 709
;709:		vic->client->pers.globalID = globalID;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 980
ADDP4
ADDRLP4 2060
INDIRI4
ASGNI4
LABELV $410
line 711
;710:
;711:	return qtrue;
CNSTI4 1
RETI4
LABELV $398
endproc G_adminGlobal 2104 36
export G_globalAddToWhitelist
proc G_globalAddToWhitelist 420 32
line 715
;712:}
;713://WHITELIST FUNCTIONS
;714:void G_globalAddToWhitelist(gentity_t *ent, gentity_t *victim, char *who, char *reason, char *ip, char *guid)
;715:{
line 716
;716:	whitelist_t *temp = G_Alloc(sizeof(whitelist_t));
CNSTI4 1156
ARGI4
ADDRLP4 260
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 260
INDIRP4
ASGNP4
line 719
;717:	char data[255];
;718:
;719:	Q_strncpyz(temp->adminName, (G_isPlayerConnected(ent))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $414
ADDRLP4 272
CNSTI4 516
ASGNI4
ADDRLP4 264
ADDRFP4 0
INDIRP4
ADDRLP4 272
INDIRI4
ADDP4
INDIRP4
ADDRLP4 272
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $415
JUMPV
LABELV $414
ADDRLP4 264
ADDRGP4 $175
ASGNP4
LABELV $415
ADDRLP4 0
INDIRP4
CNSTI4 1113
ADDP4
ARGP4
ADDRLP4 264
INDIRP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 722
;720:			? ent->client->pers.netname
;721:			: "console", sizeof(temp->adminName));
;722:	Q_strncpyz(temp->playerName, (G_isPlayerConnected(victim))
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $417
ADDRLP4 284
CNSTI4 516
ASGNI4
ADDRLP4 276
ADDRFP4 4
INDIRP4
ADDRLP4 284
INDIRI4
ADDP4
INDIRP4
ADDRLP4 284
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $418
JUMPV
LABELV $417
ADDRLP4 276
ADDRGP4 $171
ASGNP4
LABELV $418
ADDRLP4 0
INDIRP4
CNSTI4 1077
ADDP4
ARGP4
ADDRLP4 276
INDIRP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 725
;723:			? victim->client->pers.netname
;724:			: "UnnamedPlayer", sizeof(temp->playerName));
;725:	Q_strncpyz(temp->guid, (guid) ? guid : "", sizeof(temp->guid));
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $421
ADDRLP4 288
ADDRFP4 20
INDIRP4
ASGNP4
ADDRGP4 $422
JUMPV
LABELV $421
ADDRLP4 288
ADDRGP4 $419
ASGNP4
LABELV $422
ADDRLP4 288
INDIRP4
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 726
;726:	Q_strncpyz(temp->ip, (ip) ? ip : "", sizeof(temp->ip));
ADDRLP4 0
INDIRP4
CNSTI4 37
ADDP4
ARGP4
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $424
ADDRLP4 292
ADDRFP4 16
INDIRP4
ASGNP4
ADDRGP4 $425
JUMPV
LABELV $424
ADDRLP4 292
ADDRGP4 $419
ASGNP4
LABELV $425
ADDRLP4 292
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 727
;727:	Q_strncpyz(temp->reason, (reason) ? reason : "", sizeof(temp->reason));
ADDRLP4 0
INDIRP4
CNSTI4 53
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $427
ADDRLP4 296
ADDRFP4 12
INDIRP4
ASGNP4
ADDRGP4 $428
JUMPV
LABELV $427
ADDRLP4 296
ADDRGP4 $419
ASGNP4
LABELV $428
ADDRLP4 296
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 729
;728:
;729:	if (trap_mysql_runquery(va("INSERT HIGH_PRIORITY INTO whitelist"
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 316
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 316
INDIRI4
CNSTI4 0
EQI4 $436
ADDRLP4 300
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $437
JUMPV
LABELV $436
ADDRLP4 300
CNSTI4 -1
ASGNI4
LABELV $437
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 320
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 320
INDIRI4
CNSTI4 0
EQI4 $438
ADDRLP4 324
CNSTI4 516
ASGNI4
ADDRLP4 304
ADDRFP4 4
INDIRP4
ADDRLP4 324
INDIRI4
ADDP4
INDIRP4
ADDRLP4 324
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $439
JUMPV
LABELV $438
ADDRLP4 304
ADDRGP4 $171
ASGNP4
LABELV $439
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 328
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
EQI4 $440
ADDRLP4 308
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $441
JUMPV
LABELV $440
ADDRLP4 308
CNSTI4 -1
ASGNI4
LABELV $441
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 332
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 332
INDIRI4
CNSTI4 0
EQI4 $442
ADDRLP4 336
CNSTI4 516
ASGNI4
ADDRLP4 312
ADDRFP4 0
INDIRP4
ADDRLP4 336
INDIRI4
ADDP4
INDIRP4
ADDRLP4 336
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $443
JUMPV
LABELV $442
ADDRLP4 312
ADDRGP4 $175
ASGNP4
LABELV $443
ADDRGP4 $431
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 37
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 300
INDIRI4
ARGI4
ADDRLP4 304
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 312
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 53
ADDP4
ARGP4
ADDRLP4 344
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 344
INDIRP4
ARGP4
ADDRLP4 348
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 1
NEI4 $429
line 740
;730:		" (ip,guid,playerid,playername,adminid,adminname,reason) "
;731:		" VALUES (\"%s\",\"%s\",\"%d\",\"%s\",\"%d\",\"%s\",\"%s\") ",
;732:		temp->ip,
;733:		temp->guid,
;734:		(G_isPlayerConnected(victim) ? victim->client->pers.mysqlid : -1),
;735:		(G_isPlayerConnected(victim) ? victim->client->pers.netname : "UnnamedPlayer"),
;736:		(G_isPlayerConnected(ent) ? ent->client->pers.mysqlid : -1),
;737:		(G_isPlayerConnected(ent) ? ent->client->pers.netname : "console"),
;738:		temp->reason))
;739:			== qtrue)
;740:	{
line 741
;741:		trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 743
;742:
;743:		AP( va( "print \"^3%s:^7 have been added to white list by %s reason: %s \n\"",
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 360
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
EQI4 $447
ADDRLP4 364
CNSTI4 516
ASGNI4
ADDRLP4 352
ADDRFP4 4
INDIRP4
ADDRLP4 364
INDIRI4
ADDP4
INDIRP4
ADDRLP4 364
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $448
JUMPV
LABELV $447
ADDRLP4 352
ADDRFP4 16
INDIRP4
ASGNP4
LABELV $448
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 368
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $449
ADDRLP4 372
CNSTI4 516
ASGNI4
ADDRLP4 356
ADDRFP4 0
INDIRP4
ADDRLP4 372
INDIRI4
ADDP4
INDIRP4
ADDRLP4 372
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $450
JUMPV
LABELV $449
ADDRLP4 356
ADDRGP4 $175
ASGNP4
LABELV $450
ADDRGP4 $444
ARGP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 376
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 376
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 747
;744:			(G_isPlayerConnected(victim) ? victim->client->pers.netname : ip),
;745:			(G_isPlayerConnected(ent)) ? ent->client->pers.netname : "console",
;746:			reason));
;747:		G_LogPrintf("^3%s:^7 have been added to white list by %s reason: %s \n",
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 388
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 388
INDIRI4
CNSTI4 0
EQI4 $454
ADDRLP4 392
CNSTI4 516
ASGNI4
ADDRLP4 380
ADDRFP4 4
INDIRP4
ADDRLP4 392
INDIRI4
ADDP4
INDIRP4
ADDRLP4 392
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $455
JUMPV
LABELV $454
ADDRLP4 380
ADDRFP4 16
INDIRP4
ASGNP4
LABELV $455
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 396
ADDRGP4 G_isPlayerConnected
CALLI4
ASGNI4
ADDRLP4 396
INDIRI4
CNSTI4 0
EQI4 $456
ADDRLP4 400
CNSTI4 516
ASGNI4
ADDRLP4 384
ADDRFP4 0
INDIRP4
ADDRLP4 400
INDIRI4
ADDP4
INDIRP4
ADDRLP4 400
INDIRI4
ADDP4
ASGNP4
ADDRGP4 $457
JUMPV
LABELV $456
ADDRLP4 384
ADDRGP4 $175
ASGNP4
LABELV $457
ADDRGP4 $451
ARGP4
ADDRLP4 380
INDIRP4
ARGP4
ADDRLP4 384
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 751
;748:			(G_isPlayerConnected(victim) ? victim->client->pers.netname : ip),
;749:			(G_isPlayerConnected(ent)) ? ent->client->pers.netname : "console",
;750:			reason);
;751:		if (trap_mysql_runquery(va("SELECT HIGH_PRIORITY id FROM whitelist ORDER BY id DESC LIMIT 1"))
ADDRGP4 $460
ARGP4
ADDRLP4 404
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 404
INDIRP4
ARGP4
ADDRLP4 408
ADDRGP4 trap_mysql_runquery
CALLI4
ASGNI4
ADDRLP4 408
INDIRI4
CNSTI4 1
NEI4 $458
line 753
;752:				== qtrue)
;753:		{
line 754
;754:			if (trap_mysql_fetchrow() == qtrue)
ADDRLP4 412
ADDRGP4 trap_mysql_fetchrow
CALLI4
ASGNI4
ADDRLP4 412
INDIRI4
CNSTI4 1
NEI4 $461
line 755
;755:			{
line 756
;756:				trap_mysql_fetchfieldbyName("id", data, sizeof(data));
ADDRGP4 $93
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 255
ARGI4
ADDRGP4 trap_mysql_fetchfieldbyName
CALLV
pop
line 757
;757:				trap_mysql_finishquery();
ADDRGP4 trap_mysql_finishquery
CALLV
pop
line 758
;758:				temp->id = atoi(data);
ADDRLP4 4
ARGP4
ADDRLP4 416
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 416
INDIRI4
ASGNI4
line 759
;759:			}
ADDRGP4 $462
JUMPV
LABELV $461
line 761
;760:			else
;761:			{
line 762
;762:				G_LogPrintf("WARNING: Couldnt insert whitelist to database\n");
ADDRGP4 $463
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 763
;763:				if (level.whitelist)
ADDRGP4 level+190024
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $464
line 764
;764:				{
line 765
;765:					temp->id = level.globals->id + 1;
ADDRLP4 0
INDIRP4
ADDRGP4 level+190020
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 766
;766:				}
ADDRGP4 $465
JUMPV
LABELV $464
line 768
;767:				else
;768:				{
line 769
;769:					temp->id = 1;
ADDRLP4 0
INDIRP4
CNSTI4 1
ASGNI4
line 770
;770:				}
LABELV $465
line 771
;771:			}
LABELV $462
line 772
;772:		}
LABELV $458
line 773
;773:	}
LABELV $429
line 774
;774:	temp->next = level.whitelist;
ADDRLP4 0
INDIRP4
CNSTI4 1152
ADDP4
ADDRGP4 level+190024
INDIRP4
ASGNP4
line 775
;775:	level.whitelist = temp;
ADDRGP4 level+190024
ADDRLP4 0
INDIRP4
ASGNP4
line 777
;776:
;777:}
LABELV $412
endproc G_globalAddToWhitelist 420 32
export G_adminWhitelistGlobal
proc G_adminWhitelistGlobal 1092 24
line 779
;778:qboolean G_adminWhitelistGlobal(gentity_t *ent, int skiparg)
;779:{
line 780
;780:	gentity_t *victim = NULL;
ADDRLP4 16
CNSTP4 0
ASGNP4
line 784
;781:	char type[5];
;782:	char who[16];
;783:	char reason[MAX_STRING_CHARS];
;784:	int playerSlot = -1;
ADDRLP4 28
CNSTI4 -1
ASGNI4
line 786
;785:
;786:	int minArguments = 2 + skiparg;
ADDRLP4 32
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 788
;787:
;788:	if (G_SayArgc() < minArguments)
ADDRLP4 1060
ADDRGP4 G_SayArgc
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
ADDRLP4 32
INDIRI4
GEI4 $471
line 789
;789:	{
line 790
;790:		ADMP( "^3!help: ^7!wadd\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $473
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 791
;791:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $470
JUMPV
LABELV $471
line 793
;792:	}
;793:	G_SayArgv(1 + skiparg, type, sizeof(type));
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 20
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 794
;794:	G_SayArgv(2 + skiparg, who, sizeof(who));
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 G_SayArgv
CALLI4
pop
line 795
;795:	Com_sprintf(reason, MAX_STRING_CHARS, "%s", G_SayConcatArgs(3 + skiparg));
ADDRFP4 4
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRLP4 1064
ADDRGP4 G_SayConcatArgs
CALLP4
ASGNP4
ADDRLP4 36
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $170
ARGP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 797
;796:
;797:	playerSlot = G_adminGlobalSetSlot(who);
ADDRLP4 0
ARGP4
ADDRLP4 1068
ADDRGP4 G_adminGlobalSetSlot
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 1068
INDIRI4
ASGNI4
line 798
;798:	if (playerSlot != -1)
ADDRLP4 28
INDIRI4
CNSTI4 -1
EQI4 $474
line 799
;799:	{
line 800
;800:		victim = &g_entities[playerSlot];
ADDRLP4 16
CNSTI4 2476
ADDRLP4 28
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 801
;801:	}
LABELV $474
line 802
;802:	if (strcmp(type, "ip") == 0)
ADDRLP4 20
ARGP4
ADDRGP4 $95
ARGP4
ADDRLP4 1072
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $476
line 803
;803:	{
line 804
;804:		if (!G_isValidIpAddress(who) && !victim)
ADDRLP4 0
ARGP4
ADDRLP4 1076
ADDRGP4 G_isValidIpAddress
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $478
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $478
line 805
;805:		{
line 806
;806:			ADMP( "^3!help: ^7INVALID IP\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $480
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 807
;807:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $470
JUMPV
LABELV $478
line 809
;808:		}
;809:		G_globalAddToWhitelist(ent, victim, who, reason, (G_isValidIpAddress(who))
ADDRLP4 0
ARGP4
ADDRLP4 1084
ADDRGP4 G_isValidIpAddress
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
EQI4 $482
ADDRLP4 1080
ADDRLP4 0
ASGNP4
ADDRGP4 $483
JUMPV
LABELV $482
ADDRLP4 1080
ADDRLP4 16
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 729
ADDP4
ASGNP4
LABELV $483
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 1080
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 G_globalAddToWhitelist
CALLV
pop
line 812
;810:				? who
;811:				: victim->client->pers.ip, NULL);
;812:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $470
JUMPV
LABELV $476
line 814
;813:	}
;814:	else if (strcmp(type, "guid") == 0)
ADDRLP4 20
ARGP4
ADDRGP4 $96
ARGP4
ADDRLP4 1076
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $484
line 815
;815:	{
line 816
;816:		if (!victim
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $488
ADDRLP4 16
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRGP4 $126
ARGP4
ADDRLP4 1084
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $486
LABELV $488
line 819
;817:				|| strcmp(victim->client->pers.guid, "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
;818:						== 0)
;819:		{
line 820
;820:			ADMP( "^3!help: ^7INVALID GUID\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $489
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 821
;821:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $470
JUMPV
LABELV $486
line 823
;822:		}
;823:		G_globalAddToWhitelist(ent, victim, who, reason, NULL, victim->client->pers.guid);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRGP4 G_globalAddToWhitelist
CALLV
pop
line 824
;824:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $470
JUMPV
LABELV $484
line 827
;825:	}
;826:	else
;827:	{
line 828
;828:		ADMP( "^3!help: ^7!wadd\n" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $473
ARGP4
ADDRGP4 G_admin_print
CALLV
pop
line 829
;829:		return qtrue;
CNSTI4 1
RETI4
LABELV $470
endproc G_adminWhitelistGlobal 1092 24
import G_getLongerWhiteName
import G_isValidIpAddress
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
LABELV $489
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
byte 1 73
byte 1 78
byte 1 86
byte 1 65
byte 1 76
byte 1 73
byte 1 68
byte 1 32
byte 1 71
byte 1 85
byte 1 73
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $480
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
byte 1 73
byte 1 78
byte 1 86
byte 1 65
byte 1 76
byte 1 73
byte 1 68
byte 1 32
byte 1 73
byte 1 80
byte 1 10
byte 1 0
align 1
LABELV $473
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
byte 1 97
byte 1 100
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $463
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 116
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
byte 1 32
byte 1 116
byte 1 111
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
LABELV $460
byte 1 83
byte 1 69
byte 1 76
byte 1 69
byte 1 67
byte 1 84
byte 1 32
byte 1 72
byte 1 73
byte 1 71
byte 1 72
byte 1 95
byte 1 80
byte 1 82
byte 1 73
byte 1 79
byte 1 82
byte 1 73
byte 1 84
byte 1 89
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 70
byte 1 82
byte 1 79
byte 1 77
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
byte 1 32
byte 1 79
byte 1 82
byte 1 68
byte 1 69
byte 1 82
byte 1 32
byte 1 66
byte 1 89
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 68
byte 1 69
byte 1 83
byte 1 67
byte 1 32
byte 1 76
byte 1 73
byte 1 77
byte 1 73
byte 1 84
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $451
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 58
byte 1 94
byte 1 55
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
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
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
byte 1 32
byte 1 98
byte 1 121
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
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $444
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 58
byte 1 94
byte 1 55
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
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
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
byte 1 32
byte 1 98
byte 1 121
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
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $431
byte 1 73
byte 1 78
byte 1 83
byte 1 69
byte 1 82
byte 1 84
byte 1 32
byte 1 72
byte 1 73
byte 1 71
byte 1 72
byte 1 95
byte 1 80
byte 1 82
byte 1 73
byte 1 79
byte 1 82
byte 1 73
byte 1 84
byte 1 89
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 79
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
byte 1 32
byte 1 40
byte 1 105
byte 1 112
byte 1 44
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 44
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 44
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 44
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 105
byte 1 100
byte 1 44
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 44
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 41
byte 1 32
byte 1 32
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 83
byte 1 32
byte 1 40
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 41
byte 1 32
byte 1 0
align 1
LABELV $419
byte 1 0
align 1
LABELV $407
byte 1 94
byte 1 51
byte 1 78
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
LABELV $402
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
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $386
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
LABELV $384
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
LABELV $370
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 55
byte 1 37
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
byte 1 32
byte 1 94
byte 1 51
byte 1 73
byte 1 68
byte 1 58
byte 1 94
byte 1 55
byte 1 37
byte 1 100
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $367
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
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $365
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
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $363
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
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $361
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
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $359
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
byte 1 0
align 1
LABELV $342
byte 1 37
byte 1 115
byte 1 32
byte 1 37
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
byte 1 44
byte 1 32
byte 1 73
byte 1 68
byte 1 58
byte 1 32
byte 1 35
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $334
byte 1 110
byte 1 111
byte 1 116
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
LABELV $331
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 58
byte 1 94
byte 1 55
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
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
byte 1 32
byte 1 94
byte 1 51
byte 1 73
byte 1 68
byte 1 58
byte 1 94
byte 1 55
byte 1 35
byte 1 37
byte 1 100
byte 1 32
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $328
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
byte 1 0
align 1
LABELV $327
byte 1 33
byte 1 103
byte 1 109
byte 1 117
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $325
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $324
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
byte 1 0
align 1
LABELV $322
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $321
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
byte 1 0
align 1
LABELV $319
byte 1 97
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 115
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
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 115
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $318
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
byte 1 0
align 1
LABELV $316
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
byte 1 0
align 1
LABELV $315
byte 1 33
byte 1 103
byte 1 98
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $292
byte 1 68
byte 1 69
byte 1 76
byte 1 69
byte 1 84
byte 1 69
byte 1 32
byte 1 81
byte 1 85
byte 1 73
byte 1 67
byte 1 75
byte 1 32
byte 1 70
byte 1 82
byte 1 79
byte 1 77
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
byte 1 32
byte 1 87
byte 1 72
byte 1 69
byte 1 82
byte 1 69
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 61
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 76
byte 1 73
byte 1 77
byte 1 73
byte 1 84
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $279
byte 1 67
byte 1 97
byte 1 110
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 32
byte 1 37
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
byte 1 44
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 33
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
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 33
byte 1 103
byte 1 115
byte 1 121
byte 1 110
byte 1 99
byte 1 10
byte 1 0
align 1
LABELV $278
byte 1 68
byte 1 69
byte 1 76
byte 1 69
byte 1 84
byte 1 69
byte 1 32
byte 1 81
byte 1 85
byte 1 73
byte 1 67
byte 1 75
byte 1 32
byte 1 70
byte 1 82
byte 1 79
byte 1 77
byte 1 32
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 32
byte 1 87
byte 1 72
byte 1 69
byte 1 82
byte 1 69
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 61
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 76
byte 1 73
byte 1 77
byte 1 73
byte 1 84
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $263
byte 1 79
byte 1 84
byte 1 72
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $262
byte 1 66
byte 1 65
byte 1 78
byte 1 0
align 1
LABELV $260
byte 1 77
byte 1 85
byte 1 84
byte 1 69
byte 1 0
align 1
LABELV $258
byte 1 72
byte 1 65
byte 1 78
byte 1 68
byte 1 89
byte 1 67
byte 1 65
byte 1 80
byte 1 0
align 1
LABELV $256
byte 1 70
byte 1 79
byte 1 82
byte 1 67
byte 1 69
byte 1 83
byte 1 80
byte 1 69
byte 1 67
byte 1 0
align 1
LABELV $254
byte 1 68
byte 1 69
byte 1 78
byte 1 89
byte 1 66
byte 1 85
byte 1 73
byte 1 76
byte 1 68
byte 1 0
align 1
LABELV $238
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 87
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
byte 1 32
byte 1 73
byte 1 68
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $229
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
byte 1 44
byte 1 32
byte 1 99
byte 1 97
byte 1 117
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 32
byte 1 35
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $228
byte 1 94
byte 1 51
byte 1 66
byte 1 97
byte 1 110
byte 1 32
byte 1 73
byte 1 68
byte 1 58
byte 1 94
byte 1 55
byte 1 37
byte 1 100
byte 1 32
byte 1 94
byte 1 51
byte 1 82
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 51
byte 1 65
byte 1 112
byte 1 112
byte 1 101
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 94
byte 1 55
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $227
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
byte 1 100
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
LABELV $213
byte 1 99
byte 1 108
byte 1 95
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $196
byte 1 67
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 32
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 32
byte 1 116
byte 1 111
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
LABELV $193
byte 1 83
byte 1 69
byte 1 76
byte 1 69
byte 1 67
byte 1 84
byte 1 32
byte 1 72
byte 1 73
byte 1 71
byte 1 72
byte 1 95
byte 1 80
byte 1 82
byte 1 73
byte 1 79
byte 1 82
byte 1 73
byte 1 84
byte 1 89
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 70
byte 1 82
byte 1 79
byte 1 77
byte 1 32
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 32
byte 1 79
byte 1 82
byte 1 68
byte 1 69
byte 1 82
byte 1 32
byte 1 66
byte 1 89
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 68
byte 1 69
byte 1 83
byte 1 67
byte 1 32
byte 1 76
byte 1 73
byte 1 77
byte 1 73
byte 1 84
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $181
byte 1 73
byte 1 78
byte 1 83
byte 1 69
byte 1 82
byte 1 84
byte 1 32
byte 1 72
byte 1 73
byte 1 71
byte 1 72
byte 1 95
byte 1 80
byte 1 82
byte 1 73
byte 1 79
byte 1 82
byte 1 73
byte 1 84
byte 1 89
byte 1 32
byte 1 73
byte 1 78
byte 1 84
byte 1 79
byte 1 32
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 32
byte 1 40
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 44
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 105
byte 1 100
byte 1 44
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 44
byte 1 105
byte 1 112
byte 1 44
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 44
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 44
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 44
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 44
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 44
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 41
byte 1 32
byte 1 32
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 83
byte 1 32
byte 1 40
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 44
byte 1 34
byte 1 37
byte 1 100
byte 1 34
byte 1 44
byte 1 34
byte 1 122
byte 1 34
byte 1 41
byte 1 32
byte 1 0
align 1
LABELV $175
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $174
byte 1 122
byte 1 0
align 1
LABELV $171
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
LABELV $170
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $164
byte 1 37
byte 1 48
byte 1 52
byte 1 105
byte 1 45
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 45
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $144
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
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 0
align 1
LABELV $143
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
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
byte 1 99
byte 1 97
byte 1 117
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 112
byte 1 112
byte 1 101
byte 1 97
byte 1 108
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $142
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 58
byte 1 94
byte 1 55
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
byte 1 99
byte 1 97
byte 1 117
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 10
byte 1 0
align 1
LABELV $126
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
LABELV $111
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $107
byte 1 83
byte 1 69
byte 1 76
byte 1 69
byte 1 67
byte 1 84
byte 1 32
byte 1 72
byte 1 73
byte 1 71
byte 1 72
byte 1 95
byte 1 80
byte 1 82
byte 1 73
byte 1 79
byte 1 82
byte 1 73
byte 1 84
byte 1 89
byte 1 32
byte 1 42
byte 1 32
byte 1 70
byte 1 82
byte 1 79
byte 1 77
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
byte 1 32
byte 1 79
byte 1 82
byte 1 68
byte 1 69
byte 1 82
byte 1 32
byte 1 66
byte 1 89
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 65
byte 1 83
byte 1 67
byte 1 0
align 1
LABELV $104
byte 1 81
byte 1 117
byte 1 101
byte 1 114
byte 1 121
byte 1 32
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 71
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 73
byte 1 110
byte 1 105
byte 1 116
byte 1 44
byte 1 32
byte 1 100
byte 1 97
byte 1 116
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 98
byte 1 97
byte 1 98
byte 1 108
byte 1 121
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
byte 1 101
byte 1 100
byte 1 44
byte 1 32
byte 1 116
byte 1 114
byte 1 121
byte 1 32
byte 1 33
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
byte 1 10
byte 1 0
align 1
LABELV $101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $100
byte 1 115
byte 1 117
byte 1 98
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $99
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $98
byte 1 114
byte 1 101
byte 1 97
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $97
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $96
byte 1 103
byte 1 117
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $95
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $94
byte 1 97
byte 1 100
byte 1 109
byte 1 105
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $93
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $89
byte 1 83
byte 1 69
byte 1 76
byte 1 69
byte 1 67
byte 1 84
byte 1 32
byte 1 72
byte 1 73
byte 1 71
byte 1 72
byte 1 95
byte 1 80
byte 1 82
byte 1 73
byte 1 79
byte 1 82
byte 1 73
byte 1 84
byte 1 89
byte 1 32
byte 1 42
byte 1 32
byte 1 70
byte 1 82
byte 1 79
byte 1 77
byte 1 32
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 32
byte 1 79
byte 1 82
byte 1 68
byte 1 69
byte 1 82
byte 1 32
byte 1 66
byte 1 89
byte 1 32
byte 1 105
byte 1 100
byte 1 32
byte 1 65
byte 1 83
byte 1 67
byte 1 0
