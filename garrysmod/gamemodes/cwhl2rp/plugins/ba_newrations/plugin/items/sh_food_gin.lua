--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Gin";
ITEM.uniqueID = "food_gin";
ITEM.cost = 50;
ITEM.model = "models/bioshockinfinite/jin_bottle.mdl";
ITEM.weight = 2.5;
ITEM.access = "1";
ITEM.useText = "Drink";
ITEM.business = true;
ITEM.category = "Consumables";
ITEM.description = "An old-school drink containing a load of alcohol in it. This will most likely make you drunk. Rare to come by. Usually to help people sleep.";
ITEM.sleep = 15;
ITEM.thirst = -5;
ITEM.hunger = -5;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

-- Called when the item's functions should be edited.
function ITEM:OnEditFunctions(functions)
	if (Schema:PlayerIsCombine(Clockwork.Client, false)) then
		for k, v in pairs(functions) do
			if (v == "Drink") then functions[k] = nil; end;
		end;
	end;
end;

ITEM:Register();