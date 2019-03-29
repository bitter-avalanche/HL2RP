--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Jar of Pickles";
ITEM.uniqueID = "food_pickles";
ITEM.model = "models/bioshockinfinite/dickle_jar.mdl";
ITEM.weight = 1.7;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Ew! You're not thinking of eating this, right..?";
ITEM.business = true;
ITEM.cost = 20;
ITEM.access = "1";
ITEM.hunger = 15;
ITEM.thirst = 15;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();