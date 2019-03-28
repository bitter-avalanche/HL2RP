--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Banana";
ITEM.uniqueID = "food_banana";
ITEM.model = "models/bioshockinfinite/hext_banana.mdl";
ITEM.weight = 1;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A yellow banana. You don't know whether to trust this or not.";
ITEM.business = true;
ITEM.cost = 15;
ITEM.access = "1";
ITEM.hunger = 5;
ITEM.thirst = 5;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();