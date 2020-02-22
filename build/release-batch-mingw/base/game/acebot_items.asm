export ACEIT_IsReachable
code
proc ACEIT_IsReachable 76 28
file "..\..\..\..\src/game/acebot_items.c"
line 37
;1:/*
;2: ===========================================================================
;3: Copyright (C) 1998 Steve Yeager
;4: Copyright (C) 2008 Robert Beckebans <trebor_7@users.sourceforge.net>
;5:
;6: This file is part of XreaL source code.
;7:
;8: XreaL source code is free software; you can redistribute it
;9: and/or modify it under the terms of the GNU General Public License as
;10: published by the Free Software Foundation; either version 2 of the License,
;11: or (at your option) any later version.
;12:
;13: XreaL source code is distributed in the hope that it will be
;14: useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;15: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;16: GNU General Public License for more details.
;17:
;18: You should have received a copy of the GNU General Public License
;19: along with XreaL source code; if not, write to the Free Software
;20: Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;21: ===========================================================================
;22: */
;23://
;24://  acebot_items.c - This file contains all of the
;25://                   item handling routines for the
;26://                   ACE bot, including fact table support
;27:
;28:
;29:#include "g_local.h"
;30:#include "acebot.h"
;31:
;32:#if defined(ACEBOT)
;33:
;34:// Can we get there?
;35:qboolean
;36:ACEIT_IsReachable(gentity_t * self, vec3_t goal)
;37:{
line 41
;38:  trace_t trace;
;39:  vec3_t v;
;40:
;41:  VectorCopy(self->r.mins, v);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRB
ASGNB 12
line 42
;42:  v[2] += STEPSIZE;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 44
;43:
;44:  trap_Trace(
ADDRLP4 12
ARGP4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 48
;45:    &trace, self->client->ps.origin, v, self->r.maxs, goal, self->s.number, MASK_PLAYERSOLID);
;46:
;47:  // Yes we can see it
;48:  if (trace.fraction == 1)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $89
line 49
;49:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $87
JUMPV
LABELV $89
line 51
;50:  else
;51:    return qfalse;
CNSTI4 0
RETI4
LABELV $87
endproc ACEIT_IsReachable 76 28
export ACEIT_IsVisible
proc ACEIT_IsVisible 68 28
line 57
;52:}
;53:
;54:// Visiblilty check
;55:qboolean
;56:ACEIT_IsVisible(gentity_t * self, vec3_t goal)
;57:{
line 60
;58:  trace_t trace;
;59:
;60:  trap_Trace(&trace, self->client->ps.origin, NULL, NULL, goal, self->s.number, MASK_PLAYERSOLID);
ADDRLP4 0
ARGP4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 64
CNSTP4 0
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
INDIRI4
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 63
;61:
;62:  // Yes we can see it
;63:  if (trace.fraction == 1)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $93
line 64
;64:    return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $92
JUMPV
LABELV $93
line 66
;65:  else
;66:    return qfalse;
CNSTI4 0
RETI4
LABELV $92
endproc ACEIT_IsVisible 68 28
export ACEIT_ChangeWeapon
proc ACEIT_ChangeWeapon 0 0
line 72
;67:}
;68:
;69://  Weapon changing support
;70:qboolean
;71:ACEIT_ChangeWeapon(gentity_t * self, weapon_t weapon)
;72:{
line 86
;73:  // see if we're already using it
;74:  //  if(self->client->ps.weapon == weapon)
;75:  //      return qtrue;
;76:
;77:  // has not picked up weapon yet
;78:  /*if(!(self->client->ps.stats[STAT_WEAPONS] & BIT(weapon)))
;79:   return qfalse;
;80:
;81:
;82:   // change to this weapon
;83:   self->client->pers.cmd.weapon = weapon;
;84:
;85:   return qtrue;*/
;86:  return qtrue;
CNSTI4 1
RETI4
LABELV $96
endproc ACEIT_ChangeWeapon 0 0
export ACEIT_ItemNeed
proc ACEIT_ItemNeed 0 0
line 91
;87:}
;88:
;89:float
;90:ACEIT_ItemNeed(gentity_t * self, gentity_t * itemEnt)
;91:{
line 92
;92:  return 0.0f;
CNSTF4 0
RETF4
LABELV $97
endproc ACEIT_ItemNeed 0 0
export ACEIT_BuildItemNodeTable
proc ACEIT_BuildItemNodeTable 76 8
line 353
;93:  /*
;94:   // Tr3B: logic based on BG_CanItemBeGrabbed
;95:
;96:   gitem_t        *item = itemEnt->item;
;97:
;98:   #ifdef MISSIONPACK
;99:   int             upperBound;
;100:   #endif
;101:
;102:   // raynorpat: improved the item weights a tad bit
;103:   switch (item->giType)
;104:   {
;105:   case IT_WEAPON:
;106:   {
;107:   if(item->giTag == WP_MACHINEGUN)
;108:   {
;109:   return 7.0f;
;110:   }
;111:   else if(item->giTag == WP_SHOTGUN)
;112:   {
;113:   return 5.0f;
;114:   }
;115:   else if(item->giTag == WP_FLAK_CANNON)
;116:   {
;117:   return 4.0f;
;118:   }
;119:   else if(item->giTag == WP_ROCKET_LAUNCHER)
;120:   {
;121:   return 12.0f;
;122:   }
;123:   else if(item->giTag == WP_RAILGUN)
;124:   {
;125:   return 8.5f;
;126:   }
;127:   else if(item->giTag == WP_BFG)
;128:   {
;129:   return 3.0f;
;130:   }
;131:   else if(item->giTag == WP_LIGHTNING)
;132:   {
;133:   return 5.0f;
;134:   }
;135:   else if(item->giTag == WP_PLASMAGUN)
;136:   {
;137:   return 5.0f;
;138:   }
;139:   return 0.0f;
;140:   }
;141:
;142:   case IT_AMMO:
;143:   {
;144:   if(self->client->ps.ammo[item->giTag] >= 200)
;145:   {
;146:   return 0.0f;	// can't hold any more
;147:   }
;148:   else if(item->giTag == WP_MACHINEGUN)
;149:   {
;150:   return 5.0f;
;151:   }
;152:   else if(item->giTag == WP_SHOTGUN)
;153:   {
;154:   return 3.5f;
;155:   }
;156:   else if(item->giTag == WP_FLAK_CANNON)
;157:   {
;158:   return 3.0f;
;159:   }
;160:   else if(item->giTag == WP_ROCKET_LAUNCHER)
;161:   {
;162:   return 9.0f;
;163:   }
;164:   else if(item->giTag == WP_RAILGUN)
;165:   {
;166:   return 2.5f;
;167:   }
;168:   else if(item->giTag == WP_BFG)
;169:   {
;170:   return 4.5f;
;171:   }
;172:   else if(item->giTag == WP_LIGHTNING)
;173:   {
;174:   return 4.0f;
;175:   }
;176:   else if(item->giTag == WP_PLASMAGUN)
;177:   {
;178:   return 4.0f;
;179:   }
;180:   return 0.0f;
;181:   }
;182:
;183:   case IT_ARMOR:
;184:   {
;185:   #ifdef MISSIONPACK
;186:   if(bg_itemlist[ps->stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT)
;187:   {
;188:   return 0.0f;
;189:   }
;190:
;191:   // we also clamp armor to the maxhealth for handicapping
;192:   if(bg_itemlist[ps->stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD)
;193:   {
;194:   upperBound = ps->stats[STAT_MAX_HEALTH];
;195:   }
;196:   else
;197:   {
;198:   upperBound = ps->stats[STAT_MAX_HEALTH] * 2;
;199:   }
;200:
;201:   if(ps->stats[STAT_ARMOR] >= upperBound)
;202:   {
;203:   return 0.0f;
;204:   }
;205:   #else
;206:   if(self->client->ps.stats[STAT_ARMOR] >= self->client->ps.stats[STAT_MAX_HEALTH] * 2)
;207:   {
;208:   return 0.0f;
;209:   }
;210:   #endif
;211:   return 10.0f;
;212:   }
;213:
;214:   case IT_HEALTH:
;215:   {
;216:   // small and mega healths will go over the max, otherwise
;217:   // don't pick up if already at max
;218:   #ifdef MISSIONPACK
;219:   if(bg_itemlist[self->client->ps->stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD)
;220:   {
;221:   upperBound = self->client->ps->stats[STAT_MAX_HEALTH];
;222:   }
;223:   else
;224:   #endif
;225:   if(item->quantity == 5 || item->quantity == 100)
;226:   {
;227:   if(self->client->ps.stats[STAT_HEALTH] >= self->client->ps.stats[STAT_MAX_HEALTH] * 2)
;228:   {
;229:   return 0.0f;
;230:   }
;231:
;232:   return 1.0f - (float)self->health / (self->client->ps.stats[STAT_MAX_HEALTH] * 2);	// worse off, higher priority;
;233:   }
;234:
;235:   if(self->client->ps.stats[STAT_HEALTH] >= self->client->ps.stats[STAT_MAX_HEALTH])
;236:   {
;237:   return 0.0f;
;238:   }
;239:
;240:   return 1.0f - (float)self->health / 100.0f;	// worse off, higher priority
;241:   }
;242:
;243:   case IT_POWERUP:
;244:   {
;245:   if(item->giTag == PW_QUAD)
;246:   {
;247:   return 5.5f;
;248:   }
;249:   else if(item->giTag == PW_BATTLESUIT)
;250:   {
;251:   return 4.5f;
;252:   }
;253:   else if(item->giTag == PW_HASTE)
;254:   {
;255:   return 4.0f;
;256:   }
;257:   else if(item->giTag == PW_INVIS)
;258:   {
;259:   return 4.0f;
;260:   }
;261:   else if(item->giTag == PW_REGEN)
;262:   {
;263:   return 4.0f;
;264:   }
;265:   else if(item->giTag == PW_FLIGHT)
;266:   {
;267:   return 4.0f;
;268:   }
;269:   return 0.0f;
;270:   }
;271:
;272:   case IT_HOLDABLE:
;273:   {
;274:   if(item->giTag == HI_TELEPORTER)
;275:   {
;276:   return 4.0f;
;277:   }
;278:   else if(item->giTag == HI_MEDKIT)
;279:   {
;280:   return 4.0f;
;281:   }
;282:   return 0.0f;
;283:   }
;284:
;285:   case IT_TEAM:
;286:   {
;287:   // team items, such as flags
;288:   if(g_gametype.integer == GT_1FCTF)
;289:   {
;290:   // neutral flag can always be picked up
;291:   if(itemEnt->item->giTag == PW_NEUTRALFLAG)
;292:   {
;293:   return 40.0f;
;294:   }
;295:   if(self->client->ps.persistant[PERS_TEAM] == TEAM_RED)
;296:   {
;297:   if(item->giTag == PW_BLUEFLAG && self->client->ps.powerups[PW_NEUTRALFLAG])
;298:   {
;299:   return 40.0f;
;300:   }
;301:   }
;302:   else if(self->client->ps.persistant[PERS_TEAM] == TEAM_BLUE)
;303:   {
;304:   if(item->giTag == PW_REDFLAG && self->client->ps.powerups[PW_NEUTRALFLAG])
;305:   {
;306:   return 40.0f;
;307:   }
;308:   }
;309:   }
;310:
;311:   if(g_gametype.integer == GT_CTF)
;312:   {
;313:   // ent->modelindex2 is non-zero on items if they are dropped
;314:   // we need to know this because we can pick up our dropped flag (and return it)
;315:   // but we can't pick up our flag at base
;316:   if(self->client->ps.persistant[PERS_TEAM] == TEAM_RED)
;317:   {
;318:   if(item->giTag == PW_BLUEFLAG ||
;319:   (item->giTag == PW_REDFLAG && itemEnt->s.modelindex2) ||
;320:   (item->giTag == PW_REDFLAG && self->client->ps.powerups[PW_BLUEFLAG]))
;321:   return 40.0f;
;322:   }
;323:   else if(self->client->ps.persistant[PERS_TEAM] == TEAM_BLUE)
;324:   {
;325:   if(item->giTag == PW_REDFLAG ||
;326:   (item->giTag == PW_BLUEFLAG && itemEnt->s.modelindex2) ||
;327:   (item->giTag == PW_BLUEFLAG && self->client->ps.powerups[PW_REDFLAG]))
;328:   return 40.0f;
;329:   }
;330:   }
;331:
;332:   if(g_gametype.integer == GT_HARVESTER)
;333:   {
;334:   return 40.0f;
;335:   }
;336:
;337:   return 0.0f;
;338:   }
;339:
;340:   default:
;341:   return 0.0f;
;342:   }
;343:   */
;344:}
;345:
;346:// Only called once per level, when saved will not be called again
;347://
;348:// Downside of the routine is that items can not move about. If the level
;349:// has been saved before and reloaded, it could cause a problem if there
;350:// are items that spawn at random locations.
;351:void
;352:ACEIT_BuildItemNodeTable(qboolean rebuild)
;353:{
line 359
;354:  int i;
;355:  gentity_t *ent;
;356:  vec3_t v, v1, v2;
;357:  int nodeType;
;358:
;359:  for(i = 0, ent = &g_entities[0];i < level.num_entities;i++, ent++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 16
ADDRGP4 g_entities
ASGNP4
ADDRGP4 $102
JUMPV
LABELV $99
line 360
;360:  {
line 361
;361:    if (!ent->inuse)
ADDRLP4 16
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $104
line 362
;362:      continue;
ADDRGP4 $100
JUMPV
LABELV $104
line 392
;363:
;364:    /*
;365:     // special node dropping for platforms
;366:     if(!Q_stricmp(ent->item->classname, "func_plat"))
;367:     {
;368:     if(!rebuild)
;369:     ACEND_AddNode(ent, NODE_PLATFORM);
;370:     item_index = 99; // to allow to pass the item index test
;371:     }
;372:
;373:     // special node dropping for teleporters
;374:     if(!Q_stricmp(ent->item->classname, "misc_teleporter_dest") || !Q_stricmp(ent->item->classname, "trigger_teleport"))
;375:     {
;376:     if(!rebuild)
;377:     ACEND_AddNode(ent, NODE_TELEPORTER);
;378:     item_index = 99;
;379:     }
;380:     */
;381:
;382:    /*if(ent->item)
;383:     {
;384:     // FIXME: ignore dropped items for now, because they would create too many nodes
;385:     // it would be necessary to remove nodes if we want to support them
;386:     if(ent->flags & FL_DROPPED_ITEM)
;387:     continue;
;388:
;389:     nodeType = NODE_ITEM;
;390:     }
;391:     else*/
;392:    if (!Q_stricmp(ent->classname, "trigger_teleport"))
ADDRLP4 16
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $108
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $106
line 393
;393:    {
line 394
;394:      nodeType = NODE_TRIGGER_TELEPORT;
ADDRLP4 32
CNSTI4 2
ASGNI4
line 395
;395:    }
ADDRGP4 $107
JUMPV
LABELV $106
line 402
;396:    /*
;397:     else if(!Q_stricmp(ent->classname, "misc_teleporter_dest"))
;398:     {
;399:     nodeType = NODE_TARGET_TELEPORT;
;400:     }
;401:     */
;402:    else if (!Q_stricmp(ent->classname, "trigger_push"))
ADDRLP4 16
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $111
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $100
line 403
;403:    {
line 404
;404:      nodeType = NODE_JUMPPAD;
ADDRLP4 32
CNSTI4 8
ASGNI4
line 405
;405:    }
line 407
;406:    else
;407:    {
line 409
;408:      // entity does not matter
;409:      continue;
LABELV $110
LABELV $107
line 413
;410:    }
;411:
;412:    // if new, add nodes for items
;413:    if (!rebuild)
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $112
line 414
;414:    {
line 416
;415:      // add a new node at the item's location.
;416:      G_Printf("Node Added from buildItemNodeTable");
ADDRGP4 $114
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 417
;417:      ent->node = ACEND_AddNode(ent, nodeType);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 ACEND_AddNode
CALLI4
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 2428
ADDP4
ADDRLP4 60
INDIRI4
ASGNI4
line 418
;418:    }
ADDRGP4 $113
JUMPV
LABELV $112
line 420
;419:    else
;420:    {
line 422
;421:      // find stored location
;422:      for(i = 0;i < numNodes;i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $118
JUMPV
LABELV $115
line 423
;423:      {
line 424
;424:        if (nodes[i].type == NODE_ITEM || nodes[i].type == NODE_PLATFORM || nodes[i].type
ADDRLP4 56
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 56
INDIRI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
CNSTI4 3
EQI4 $127
ADDRLP4 56
INDIRI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
CNSTI4 1
EQI4 $127
ADDRLP4 56
INDIRI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
CNSTI4 2
EQI4 $127
ADDRLP4 56
INDIRI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
CNSTI4 8
NEI4 $119
LABELV $127
line 426
;425:            == NODE_TRIGGER_TELEPORT || nodes[i].type == NODE_JUMPPAD) // valid types
;426:        {
line 427
;427:          if (nodes[i].type == NODE_ITEM)
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
CNSTI4 3
NEI4 $128
line 428
;428:          {
line 429
;429:            VectorCopy(ent->s.origin, v);
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 431
;430:            //v[2] += 16;
;431:          }
ADDRGP4 $129
JUMPV
LABELV $128
line 432
;432:          else if (nodes[i].type == NODE_TRIGGER_TELEPORT)
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
CNSTI4 2
NEI4 $131
line 433
;433:          {
line 434
;434:            VectorAdd(ent->r.absmin, ent->r.absmax, v);
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16
INDIRP4
CNSTI4 468
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDF4
ASGNF4
line 435
;435:            VectorScale(v, 0.5, v);
ADDRLP4 68
CNSTF4 1056964608
ASGNF4
ADDRLP4 4
ADDRLP4 68
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 68
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+8
CNSTF4 1056964608
ADDRLP4 4+8
INDIRF4
MULF4
ASGNF4
line 436
;436:          }
ADDRGP4 $132
JUMPV
LABELV $131
line 443
;437:          /*
;438:           else if(nodes[i].type == NODE_TARGET_TELEPORT)
;439:           {
;440:           v[2] += 32;
;441:           }
;442:           */
;443:          else if (nodes[i].type == NODE_JUMPPAD)
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 nodes+12
ADDP4
INDIRI4
CNSTI4 8
NEI4 $140
line 444
;444:          {
line 445
;445:            VectorAdd(ent->r.absmin, ent->r.absmax, v);
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 16
INDIRP4
CNSTI4 468
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 16
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDF4
ASGNF4
line 446
;446:            VectorScale(v, 0.5, v);
ADDRLP4 68
CNSTF4 1056964608
ASGNF4
ADDRLP4 4
ADDRLP4 68
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 68
INDIRF4
ADDRLP4 4+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 4+8
CNSTF4 1056964608
ADDRLP4 4+8
INDIRF4
MULF4
ASGNF4
line 449
;447:
;448:            // add jumppad target offset
;449:            VectorNormalize2(ent->s.origin2, v2);
ADDRLP4 16
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 450
;450:            VectorMA(v, 32, v2, v);
ADDRLP4 72
CNSTF4 1107296256
ASGNF4
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 20+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1107296256
ADDRLP4 20+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 451
;451:          }
ADDRGP4 $141
JUMPV
LABELV $140
line 453
;452:          else /*if(nodes[i].type == NODE_PLATFORM) */
;453:          {
line 454
;454:            VectorCopy(ent->r.maxs, v1);
ADDRLP4 36
ADDRLP4 16
INDIRP4
CNSTI4 448
ADDP4
INDIRB
ASGNB 12
line 455
;455:            VectorCopy(ent->r.mins, v2);
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 436
ADDP4
INDIRB
ASGNB 12
line 458
;456:
;457:            // to get the center
;458:            v[0] = (v1[0] - v2[0]) / 2 + v2[0];
ADDRLP4 60
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 36
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
CNSTF4 1073741824
DIVF4
ADDRLP4 60
INDIRF4
ADDF4
ASGNF4
line 459
;459:            v[1] = (v1[1] - v2[1]) / 2 + v2[1];
ADDRLP4 4+4
ADDRLP4 36+4
INDIRF4
ADDRLP4 20+4
INDIRF4
SUBF4
CNSTF4 1073741824
DIVF4
ADDRLP4 20+4
INDIRF4
ADDF4
ASGNF4
line 460
;460:            v[2] = ent->r.mins[2] + 64;
ADDRLP4 4+8
ADDRLP4 16
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
CNSTF4 1115684864
ADDF4
ASGNF4
line 461
;461:          }
LABELV $141
LABELV $132
LABELV $129
line 463
;462:
;463:          SnapVector(v);
ADDRLP4 4
ADDRLP4 4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 465
;464:
;465:          if ( /*ent->node != INVALID || */VectorCompare(v, nodes[i].origin))
ADDRLP4 4
ARGP4
CNSTI4 24
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 nodes
ADDP4
ARGP4
ADDRLP4 60
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $164
line 466
;466:          {
line 475
;467:            /*
;468:             if(!VectorCompare(v, nodes[i].origin))
;469:             {
;470:             // update node origin
;471:             VectorCopy(v, nodes[i].origin);
;472:             }
;473:             else
;474:             */
;475:            {
line 477
;476:              // found a match now link to facts
;477:              ent->node = i;
ADDRLP4 16
INDIRP4
CNSTI4 2428
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 478
;478:            }
line 492
;479:
;480:#if 0							//defined(_DEBUG)
;481:            if(ent->item)
;482:            {
;483:              G_Printf("relink item: %s node: %d pos: %f %f %f\n", ent->item->classname, ent->node,
;484:                  ent->s.origin[0], ent->s.origin[1], ent->s.origin[2]);
;485:            }
;486:            else
;487:            {
;488:              G_Printf("relink entity: %s node: %d pos: %f %f %f\n", ent->classname, ent->node,
;489:                  ent->s.origin[0], ent->s.origin[1], ent->s.origin[2]);
;490:            }
;491:#endif
;492:            break;
ADDRGP4 $117
JUMPV
LABELV $164
line 494
;493:          }
;494:        }
LABELV $119
line 495
;495:      }
LABELV $116
line 422
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $118
ADDRLP4 0
INDIRI4
ADDRGP4 numNodes
INDIRI4
LTI4 $115
LABELV $117
line 497
;496:
;497:      if (i == numNodes)
ADDRLP4 0
INDIRI4
ADDRGP4 numNodes
INDIRI4
NEI4 $166
line 498
;498:      {
line 500
;499:        // add a new node at the item's location.
;500:        ent->node = ACEND_AddNode(ent, nodeType);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 ACEND_AddNode
CALLI4
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 2428
ADDP4
ADDRLP4 60
INDIRI4
ASGNI4
line 501
;501:      }
LABELV $166
line 502
;502:    }
LABELV $113
line 521
;503:
;504:#if 0							//defined(_DEBUG)
;505:    //if(item_index == INVALID)
;506:    //  fprintf(pOut, "Rejected item: %s node: %d pos: %f %f %f\n", ent->item->classname, ent->node,
;507:    //          ent->s.origin[0], ent->s.origin[1], ent->s.origin[2]);
;508:    //else
;509:    if(ent->item)
;510:    {
;511:      G_Printf("accepted item: %s node: %d pos: %f %f %f\n", ent->item->classname, ent->node, ent->s.origin[0],
;512:          ent->s.origin[1], ent->s.origin[2]);
;513:    }
;514:    else
;515:    {
;516:      G_Printf("accepted entity: %s node: %d pos: %f %f %f\n", ent->classname, ent->node, ent->s.origin[0],
;517:          ent->s.origin[1], ent->s.origin[2]);
;518:    }
;519:#endif
;520:
;521:  }
LABELV $100
line 359
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
ADDRLP4 16
INDIRP4
CNSTI4 2476
ADDP4
ASGNP4
LABELV $102
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $99
line 523
;522:
;523:}
LABELV $98
endproc ACEIT_BuildItemNodeTable 76 8
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
LABELV $114
byte 1 78
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 65
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 78
byte 1 111
byte 1 100
byte 1 101
byte 1 84
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $111
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
LABELV $108
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
