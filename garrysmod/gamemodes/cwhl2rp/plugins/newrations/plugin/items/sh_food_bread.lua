--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Loaf of Bread";
ITEM.uniqueID = "food_bread";
ITEM.model = "models/bioshockinfinite/dread_loaf.mdl";
ITEM.weight = 1;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Stale, and about as hard to make you able to bash in a skull with this.";
ITEM.business = true;
ITEM.cost = 10;
ITEM.access = "1";
ITEM.hunger = 10;
ITEM.thirst = -5;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();