--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Standard Tier Supplement Powder";
ITEM.uniqueID = "normal_supplements";
ITEM.model = "models/foodnhouseholdaaaaa/combirationb.mdl";
ITEM.weight = 0.6;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A lumpy bag with a powdery substance. Smells awful, and probably won't taste much better.";
ITEM.hunger = 15;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth(math.Clamp(player:Health() + 5, 0, player:GetMaxHealth()));
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();