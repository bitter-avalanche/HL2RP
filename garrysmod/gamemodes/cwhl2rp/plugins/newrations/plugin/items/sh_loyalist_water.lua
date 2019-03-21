--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Peach Flavoured Union Water Can";
ITEM.uniqueID = "loyalist_water";
ITEM.cost = 10;
ITEM.model = "models/props_lunk/popcan01a.mdl";
ITEM.weight = 0.5;
ITEM.access = "1";
ITEM.useText = "Drink";
ITEM.skin = 1;
ITEM.business = true;
ITEM.category = "Consumables";
ITEM.description = "A can of Union Water. Unifies your thoughts, too! This one has a sweet Peach flavor.";
ITEM.thirst = 15;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetCharacterData("Stamina", 100);
	player:SetHealth(math.Clamp(player:Health() + 4, 0, player:GetMaxHealth()));
	
	player:BoostAttribute(self.name, ATB_AGILITY, 3, 120);
	player:BoostAttribute(self.name, ATB_STAMINA, 3, 120);
end;

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