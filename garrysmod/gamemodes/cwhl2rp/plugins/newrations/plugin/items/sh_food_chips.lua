--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Bag of Chips";
ITEM.uniqueID = "food_chips";
ITEM.model = "models/bioshockinfinite/bag_of_hhips.mdl";
ITEM.weight = 1;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A bag of stale, unsalted chips. You could've just eaten a potato.";
ITEM.business = true;
ITEM.cost = 20;
ITEM.access = "1";
ITEM.hunger = 5;
ITEM.thirst = -5;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();