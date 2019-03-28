--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Can of Tuna";
ITEM.uniqueID = "food_fish";
ITEM.model = "models/bioshockinfinite/cardine_can_open.mdl";
ITEM.weight = 1;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A can of tuna. Still has some water in it left. These still look fresh, too!";
ITEM.hunger = 10;
ITEM.thirst = 5;
ITEM.business = true;
ITEM.cost = 15;
ITEM.access = "1";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();