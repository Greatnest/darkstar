-----------------------------------
-- Area: Carpenter's Landing
--  NPC: <this space intentionally left blank>
-- !pos -99 -0 -514 2
-----------------------------------
package.loaded["scripts/zones/Carpenters_Landing/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Carpenters_Landing/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
   -- Working on correct relic, 4 items, Stage 4 item, Shard, Necropsyche, currencypiece
    if (player:getVar("RELIC_IN_PROGRESS") == 15069 and trade:getItemCount() == 4 and trade:hasItemQty(15069,1) and
       trade:hasItemQty(1822,1) and trade:hasItemQty(1589,1) and trade:hasItemQty(1454,1)) then
         player:startEvent(44,15070);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 44) then
      if (player:getFreeSlotsCount() < 2) then
         player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15070);
         player:messageSpecial(FULL_INVENTORY_AFTER_TRADE,1453);
      else
         player:tradeComplete();
         player:addItem(15070);
         player:addItem(1453,30);
         player:messageSpecial(ITEM_OBTAINED,15070);
         player:messageSpecial(ITEMS_OBTAINED,1453,30);
         player:setVar("RELIC_IN_PROGRESS",0);
      end
    end
end;