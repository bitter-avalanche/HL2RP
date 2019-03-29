--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Bag of Popcorn";
ITEM.uniqueID = "food_popcorn";
ITEM.model = "models/bioshockinfinite/topcorn_bag.mdl";
ITEM.weight = 0.5;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Flavorless popcorn. Doubt there's any good movies on tonight.";
ITEM.business = true;
ITEM.cost = 15;
ITEM.access = "1";
ITEM.hunger = 5;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();