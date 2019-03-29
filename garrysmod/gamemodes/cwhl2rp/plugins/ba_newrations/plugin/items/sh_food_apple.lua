--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Apple";
ITEM.uniqueID = "food_apple";
ITEM.model = "models/bioshockinfinite/hext_apple.mdl";
ITEM.weight = 0.3;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A juicy, red apple. Might save the day.";
ITEM.business = true;
ITEM.cost = 5;
ITEM.access = "1";
ITEM.hunger = 5;
ITEM.thirst = 5;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();