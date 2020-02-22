export G_itemThink
code
proc G_itemThink 4 4
file "..\..\..\..\src/game/g_item.c"
line 6
;1:#include "g_local.h"
;2:#include "tremulous.h"
;3:
;4:void
;5:G_itemThink(gentity_t *ent)
;6:{
line 7
;7:  ent->nextthink = level.time + 3000;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 8
;8:  if (level.spawnedItems >= (10 - ((level.time - level.startTime) / 1000 / 60)))
ADDRGP4 level+44
INDIRI4
CNSTI4 10
ADDRGP4 level+28
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
CNSTI4 60
DIVI4
SUBI4
LTI4 $86
line 9
;9:  {
line 10
;10:    G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 11
;11:    level.spawnedItems--;
ADDRLP4 0
ADDRGP4 level+44
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 12
;12:  }
LABELV $86
line 13
;13:}
LABELV $84
endproc G_itemThink 4 4
export G_sellAllWeapons
proc G_sellAllWeapons 12 8
line 16
;14:void
;15:G_sellAllWeapons(gentity_t *player)
;16:{
line 18
;17:  int i;
;18:  for(i = WP_NONE + 1;i < WP_NUM_WEAPONS;i++)
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $93
line 19
;19:  {
line 20
;20:    if (BG_InventoryContainsWeapon(i, player->client->ps.stats) && BG_FindPurchasableForWeapon(i))
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 BG_InventoryContainsWeapon
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $97
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_FindPurchasableForWeapon
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $97
line 21
;21:    {
line 22
;22:      BG_RemoveWeaponFromInventory(i, player->client->ps.stats);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_RemoveWeaponFromInventory
CALLV
pop
line 23
;23:    }
LABELV $97
line 24
;24:  }
LABELV $94
line 18
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 30
LTI4 $93
line 25
;25:}
LABELV $92
endproc G_sellAllWeapons 12 8
export G_switchWeapon
proc G_switchWeapon 12 20
line 28
;26:void
;27:G_switchWeapon(gentity_t *player, weapon_t weapon)
;28:{
line 31
;29:  int maxAmmo, maxClips;
;30:
;31:  G_sellAllWeapons(player);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_sellAllWeapons
CALLV
pop
line 33
;32:
;33:  BG_AddUpgradeToInventory(UP_LIGHTARMOUR, player->client->ps.stats);
CNSTI4 1
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_AddUpgradeToInventory
CALLV
pop
line 34
;34:  BG_AddUpgradeToInventory(UP_HELMET, player->client->ps.stats);
CNSTI4 2
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_AddUpgradeToInventory
CALLV
pop
line 35
;35:  BG_AddWeaponToInventory(WP_HBUILD2, player->client->ps.stats);
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
ADDRGP4 BG_AddWeaponToInventory
CALLV
pop
line 37
;36:
;37:  BG_AddWeaponToInventory(weapon, player->client->ps.stats);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_AddWeaponToInventory
CALLV
pop
line 38
;38:  BG_FindAmmoForWeapon(weapon, &maxAmmo, &maxClips);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 BG_FindAmmoForWeapon
CALLV
pop
line 39
;39:  G_ForceWeaponChange(player, weapon);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_ForceWeaponChange
CALLV
pop
line 40
;40:  BG_PackAmmoArray(weapon, &player->client->ps.ammo, player->client->ps.powerups, maxAmmo, maxClips);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 376
ADDP4
ARGP4
ADDRLP4 8
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
line 41
;41:}
LABELV $99
endproc G_switchWeapon 12 20
export G_giveHealth
proc G_giveHealth 12 12
line 44
;42:void
;43:G_giveHealth(gentity_t *player)
;44:{
line 45
;45:  trap_SendServerCommand(
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
ADDRGP4 $101
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 47
;46:    player - g_entities, "print \"^3Use construction kit to heal teammates\n\"");
;47:  player->health = player->client->ps.stats[STAT_HEALTH]
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 49
;48:      = player->client->ps.stats[STAT_MAX_HEALTH];
;49:  G_AddEvent(player, EV_MEDKIT_USED, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 61
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 51
;50:
;51:  player->client->ps.persistant[PERS_UNUSED] = 3;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 3
ASGNI4
line 52
;52:}
LABELV $100
endproc G_giveHealth 12 12
export G_giveDomes
proc G_giveDomes 12 12
line 54
;53:void G_giveDomes(gentity_t *ent)
;54:{
line 55
;55:	trap_SendServerCommand(ent - g_entities, "print \"^3Use construction kit to heal teammates and deploy healing domes!\nUse fire to deploy a dome, or use secondary fire to heal a teammate!\"");
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
ADDRGP4 $103
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 56
;56:	ent->health = ent->client->ps.stats[STAT_HEALTH] = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 57
;57:	G_AddEvent(ent, EV_MEDKIT_USED, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 61
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 58
;58:	ent->client->ps.persistant[PERS_UNUSED] = 3;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 3
ASGNI4
line 59
;59:}
LABELV $102
endproc G_giveDomes 12 12
export G_giveMine
proc G_giveMine 0 8
line 62
;60:void
;61:G_giveMine(gentity_t *player)
;62:{
line 63
;63:  BG_AddUpgradeToInventory(UP_MINE, player->client->ps.stats);
CNSTI4 6
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ARGP4
ADDRGP4 BG_AddUpgradeToInventory
CALLV
pop
line 64
;64:}
LABELV $104
endproc G_giveMine 0 8
export G_itemUse
proc G_itemUse 20 8
line 67
;65:void
;66:G_itemUse(gentity_t *self, gentity_t *other, gentity_t *activator)
;67:{
line 68
;68:  qboolean item = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 70
;69:
;70:  switch(self->s.modelindex)
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 17
LTI4 $106
ADDRLP4 4
INDIRI4
CNSTI4 25
GTI4 $106
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $118-68
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $118
address $117
address $112
address $114
address $110
address $116
address $111
address $113
address $109
address $115
code
line 71
;71:  {
LABELV $109
line 73
;72:    case BA_I_CHAINGUN:
;73:      G_switchWeapon(activator, WP_CHAINGUN);
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 G_switchWeapon
CALLV
pop
line 74
;74:      break;
ADDRGP4 $107
JUMPV
LABELV $110
line 76
;75:    case BA_I_AXE:
;76:      G_switchWeapon(activator, WP_AXE);
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 G_switchWeapon
CALLV
pop
line 77
;77:      break;
ADDRGP4 $107
JUMPV
LABELV $111
line 79
;78:    case BA_I_LASERGUN:
;79:      G_switchWeapon(activator, WP_LAS_GUN);
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 G_switchWeapon
CALLV
pop
line 80
;80:      break;
ADDRGP4 $107
JUMPV
LABELV $112
line 82
;81:    case BA_I_MACHINEGUN:
;82:      G_switchWeapon(activator, WP_MACHINEGUN);
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 G_switchWeapon
CALLV
pop
line 83
;83:      break;
ADDRGP4 $107
JUMPV
LABELV $113
line 85
;84:    case BA_I_MDRIVER:
;85:      G_switchWeapon(activator, WP_MASS_DRIVER);
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 G_switchWeapon
CALLV
pop
line 86
;86:      break;
ADDRGP4 $107
JUMPV
LABELV $114
line 88
;87:    case BA_I_SHOTGUN:
;88:      G_switchWeapon(activator, WP_SHOTGUN);
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 G_switchWeapon
CALLV
pop
line 89
;89:      break;
ADDRGP4 $107
JUMPV
LABELV $115
line 91
;90:    case BA_I_GRENADE_LAUNCHER:
;91:      G_switchWeapon(activator, WP_LAUNCHER);
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRGP4 G_switchWeapon
CALLV
pop
line 92
;92:      break;
ADDRGP4 $107
JUMPV
LABELV $116
line 94
;93:    case BA_I_ROCKET_LAUNCHER:
;94:      G_switchWeapon(activator, WP_ROCKET_LAUNCHER);
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 G_switchWeapon
CALLV
pop
line 95
;95:      break;
ADDRGP4 $107
JUMPV
LABELV $117
line 98
;96:    case BA_I_SYRINX:
;97:      //G_giveHealth(activator);
;98:      G_giveDomes(activator);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_giveDomes
CALLV
pop
line 99
;99:      break;
ADDRGP4 $107
JUMPV
LABELV $106
line 101
;100:    default:
;101:      item = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 102
;102:      break;
LABELV $107
line 107
;103:  }
;104:  ////////////////////////////////////////////////////////////////////////////
;105:  // Special Case for Mines
;106:  ////////////////////////////////////////////////////////////////////////////
;107:  if (self->s.weapon == WP_MINE && self->parent == activator)
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 11
NEI4 $120
ADDRLP4 12
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $120
line 108
;108:  {
line 109
;109:    G_giveMine(activator);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_giveMine
CALLV
pop
line 110
;110:    G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 111
;111:    activator->numMines--;
ADDRLP4 16
ADDRFP4 8
INDIRP4
CNSTI4 2320
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 112
;112:  }
ADDRGP4 $121
JUMPV
LABELV $120
line 113
;113:  else if (self->s.modelindex == BA_I_MINE)
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 26
NEI4 $122
line 114
;114:  {
line 115
;115:    G_giveMine(activator);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_giveMine
CALLV
pop
line 116
;116:    G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 117
;117:  }
ADDRGP4 $123
JUMPV
LABELV $122
line 118
;118:  else if (item == qtrue)
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $124
line 119
;119:  {
line 120
;120:    G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 121
;121:    level.spawnedItems--;
ADDRLP4 16
ADDRGP4 level+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 122
;122:  }
LABELV $124
LABELV $123
LABELV $121
line 123
;123:}
LABELV $105
endproc G_itemUse 20 8
export spawnItem
proc spawnItem 92 12
line 127
;124:
;125:gentity_t *
;126:spawnItem(gentity_t *ent, buildable_t itemtype)
;127:{
line 132
;128:  gentity_t *item;
;129:  vec3_t normal;
;130:  vec3_t origin;
;131:
;132:  VectorCopy(ent->s.origin, origin);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 134
;133:
;134:  if(G_playerInRange(ent, DOME_RANGE, PTE_HUMANS))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 89
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 G_playerInRange
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $128
line 135
;135:  {
line 136
;136:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $127
JUMPV
LABELV $128
line 138
;137:  }
;138:  if(G_itemInRange(ent, DOME_RANGE/2, PTE_NONE))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 44
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 32
ADDRGP4 G_itemInRange
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $130
line 139
;139:  {
line 140
;140:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $127
JUMPV
LABELV $130
line 142
;141:  }
;142:  if (G_doorInRange(ent, DOME_RANGE / 3, PTE_NONE))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 29
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 G_doorInRange
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $132
line 143
;143:  {
line 144
;144:    return NULL;
CNSTP4 0
RETP4
ADDRGP4 $127
JUMPV
LABELV $132
line 147
;145:  }
;146:
;147:  origin[2] += 40;
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
CNSTF4 1109393408
ADDF4
ASGNF4
line 149
;148:
;149:  item = G_Spawn();
ADDRLP4 40
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
ASGNP4
line 151
;150:
;151:  BG_FindBBoxForBuildable(itemtype, item->r.mins, item->r.maxs);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRGP4 BG_FindBBoxForBuildable
CALLV
pop
line 153
;152:
;153:  item->s.eType = ET_BUILDABLE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 155
;154:
;155:  item->classname = BG_FindEntityNameForBuildable(itemtype);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 BG_FindEntityNameForBuildable
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 48
INDIRP4
ASGNP4
line 157
;156:
;157:  item->s.modelindex = itemtype;
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 159
;158:
;159:  item->biteam = item->s.modelindex2 = BIT_HUMANS;
ADDRLP4 56
CNSTI4 2
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 956
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
line 161
;160:
;161:  VectorSet(normal, 0.0f, 0.0f, 1.0f);
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 4
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 4+8
CNSTF4 1065353216
ASGNF4
line 163
;162:
;163:  VectorMA(origin, 1.0, normal, origin);
ADDRLP4 64
CNSTF4 1065353216
ASGNF4
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRLP4 64
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 64
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
CNSTF4 1065353216
ADDRLP4 4+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 165
;164:
;165:  item->health = 10000;
ADDRLP4 0
INDIRP4
CNSTI4 812
ADDP4
CNSTI4 10000
ASGNI4
line 167
;166:
;167:  item->nextthink = level.time + 3000;
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 level+28
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 168
;168:  item->think = G_itemThink;
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 G_itemThink
ASGNP4
line 170
;169:
;170:  item->spawned = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 1
ASGNI4
line 172
;171:
;172:  item->s.number = item - g_entities;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 2476
DIVI4
ASGNI4
line 173
;173:  item->r.contents = 0;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 174
;174:  item->clipmask = MASK_SOLID;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 1
ASGNI4
line 176
;175:
;176:  item->enemy = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 876
ADDP4
CNSTP4 0
ASGNP4
line 177
;177:  item->s.weapon = BG_FindProjTypeForBuildable(itemtype);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 BG_FindProjTypeForBuildable
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 179
;178:
;179:  G_SetOrigin(item, origin);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 181
;180:
;181:  item->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 183
;182:
;183:  item->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 184
;184:  item->physicsBounce = 0.5;//BG_FindBounceForBuildable(itemtype);
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
CNSTF4 1056964608
ASGNF4
line 185
;185:  item->s.groundEntityNum = 1;//-1;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 187
;186:  //item->s.eFlags = EF_BOUNCE_HALF;
;187:  item->use = G_itemUse;
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRGP4 G_itemUse
ASGNP4
line 188
;188:  item->takedamage = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 840
ADDP4
CNSTI4 0
ASGNI4
line 191
;189:
;190:  // gently nudge the buildable onto the surface :)
;191:  VectorScale(normal, -50.0f, item->s.pos.trDelta);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 3259498496
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 3259498496
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 3259498496
ADDRLP4 4+8
INDIRF4
MULF4
ASGNF4
line 192
;192:  VectorSet(item->s.pos.trDelta,0,0,0);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 0
ASGNF4
line 193
;193:  item->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 195
;194:
;195:  item->powered = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 972
ADDP4
CNSTI4 1
ASGNI4
line 197
;196:
;197:  item->s.generic1 |= B_POWERED_TOGGLEBIT;
ADDRLP4 76
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 198
;198:  item->s.generic1 |= B_SPAWNED_TOGGLEBIT;
ADDRLP4 80
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 199
;199:  item->r.svFlags &= ~SVF_BROADCAST;
ADDRLP4 84
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 -33
BANDI4
ASGNI4
line 201
;200:
;201:  VectorCopy(normal, item->s.origin2);
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 203
;202:
;203:  trap_LinkEntity(item);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 206
;204:
;205:  //G_LogPrintf("Item Spawned");
;206:  level.spawnedItems++;
ADDRLP4 88
ADDRGP4 level+44
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 207
;207:  return item;
ADDRLP4 0
INDIRP4
RETP4
LABELV $127
endproc spawnItem 92 12
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
LABELV $103
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 85
byte 1 115
byte 1 101
byte 1 32
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
byte 1 32
byte 1 107
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
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
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 100
byte 1 101
byte 1 112
byte 1 108
byte 1 111
byte 1 121
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 111
byte 1 109
byte 1 101
byte 1 115
byte 1 33
byte 1 10
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 101
byte 1 112
byte 1 108
byte 1 111
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 100
byte 1 111
byte 1 109
byte 1 101
byte 1 44
byte 1 32
byte 1 111
byte 1 114
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 97
byte 1 114
byte 1 121
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
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
byte 1 33
byte 1 34
byte 1 0
align 1
LABELV $101
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 94
byte 1 51
byte 1 85
byte 1 115
byte 1 101
byte 1 32
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
byte 1 32
byte 1 107
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
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
byte 1 10
byte 1 34
byte 1 0
