--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Chocolate bar";
ITEM.uniqueID = "food_chocolate";
ITEM.model = "models/bioshockinfinite/hext_candy_chocolate.mdl";
ITEM.weight = 1;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A bar of flavorless chocolate. Still, it's the thought that counts, right?";
ITEM.business = true;
ITEM.cost = 25;
ITEM.access = "1";
ITEM.hunger = 5;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();