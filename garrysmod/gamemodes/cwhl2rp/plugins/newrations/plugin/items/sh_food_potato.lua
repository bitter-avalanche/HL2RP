--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Potato";
ITEM.uniqueID = "food_potato";
ITEM.model = "models/bioshockinfinite/hext_potato.mdl";
ITEM.weight = 1;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A bland potato. It positively reeks of poverty.";
ITEM.business = true;
ITEM.cost = 5;
ITEM.access = "1";
ITEM.hunger = 5;
ITEM.thirst = -5;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();