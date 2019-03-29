--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Civil Protection Tier 'Meal Ready to Eat'";
ITEM.uniqueID = "cp_mre";
ITEM.model = "models/mres/consumables/zag_mre.mdl";
ITEM.weight = 1;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A neatly wrapped up MRE. This one contains moist chicken, dry rice and a mildly depressed piece of broccoli.";
ITEM.hunger = 50;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth(math.Clamp(player:Health() + 30, 0, player:GetMaxHealth()));
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();