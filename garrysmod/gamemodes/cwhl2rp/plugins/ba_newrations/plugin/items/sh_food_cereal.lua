--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Box of Cereal";
ITEM.uniqueID = "food_cereal";
ITEM.model = "models/bioshockinfinite/hext_cereal_box_cornflakes.mdl";
ITEM.weight = 1.5;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Bland cornflakes. Definitely not the chipper start of your day you were hoping for.";
ITEM.business = true;
ITEM.cost = 20;
ITEM.access = "1";
ITEM.hunger = 15;
ITEM.thirst = -15;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();