--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Pineapple";
ITEM.uniqueID = "food_pineapple";
ITEM.model = "models/bioshockinfinite/hext_pineapple.mdl";
ITEM.weight = 1;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A pineapple. Wonder if your old cartoon hero lives here?";
ITEM.business = true;
ITEM.cost = 25;
ITEM.access = "1";
ITEM.hunger = 15;
ITEM.thirst = 15;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();