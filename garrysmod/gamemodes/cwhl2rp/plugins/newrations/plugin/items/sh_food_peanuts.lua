--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Bag of Peanuts";
ITEM.uniqueID = "food_peanuts";
ITEM.model = "models/bioshockinfinite/rag_of_peanuts.mdl";
ITEM.weight = 1;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "Peanuts that are way too salty. Pretty much like you when you get beat up again.";
ITEM.business = true;
ITEM.cost = 10;
ITEM.access = "1";
ITEM.hunger = 5;
ITEM.thirst = -5;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();