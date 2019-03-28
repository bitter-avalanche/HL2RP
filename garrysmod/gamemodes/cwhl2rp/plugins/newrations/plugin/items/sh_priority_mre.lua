--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Priority Tier 'Meal Ready to Eat'";
ITEM.uniqueID = "priority_mre";
ITEM.model = "models/mres/consumables/tag_mre.mdl";
ITEM.weight = 1;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A neatly wrapped up MRE. This one contains dry spaghetti, watery sauce and a waterlogged carrot.";
ITEM.hunger = 30;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth(math.Clamp(player:Health() + 15, 0, player:GetMaxHealth()));
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();