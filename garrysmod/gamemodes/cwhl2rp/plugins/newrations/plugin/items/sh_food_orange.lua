--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Orange";
ITEM.uniqueID = "food_orange";
ITEM.model = "models/bioshockinfinite/hext_orange.mdl";
ITEM.weight = 1;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "An orange. No, not the color.";
ITEM.business = true;
ITEM.cost = 15;
ITEM.access = "1";
ITEM.hunger = 5;
ITEM.thirst = 5;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();