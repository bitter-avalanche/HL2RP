--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Cheese wheel";
ITEM.uniqueID = "food_corn";
ITEM.model = "models/bioshockinfinite/pound_cheese.mdl";
ITEM.weight = 1;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A yellow cheese wheel. Doubt it's as tasty as the pre-war alternative.";
ITEM.business = true;
ITEM.cost = 30;
ITEM.access = "1";
ITEM.hunger = 20;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();