--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Absinthe - Black'd Tea";
ITEM.uniqueID = "food_absinthe";
ITEM.cost = 75;
ITEM.model = "models/bioshockinfinite/ebsinthebottle.mdl";
ITEM.weight = 2.5;
ITEM.access = "1";
ITEM.useText = "Drink";
ITEM.business = true;
ITEM.category = "Consumables";
ITEM.description = "One of the most alcohol holding drinks there is known to current existence. Drinking this is ill-advised.";
ITEM.sleep = 20;
ITEM.thirst = -10;
ITEM.hunger = -10;

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