--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Pear";
ITEM.uniqueID = "food_pear";
ITEM.model = "models/bioshockinfinite/hext_pear.mdl";
ITEM.weight = 1;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A pear. Seems nondescript enough.";
ITEM.business = true;
ITEM.cost = 15;
ITEM.access = "1";
ITEM.hunger = 5;
ITEM.thirst = 5;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();