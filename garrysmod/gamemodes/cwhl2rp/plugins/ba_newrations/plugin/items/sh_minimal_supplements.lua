--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Minimal Tier Supplement Powder";
ITEM.uniqueID = "minimal_supplements";
ITEM.business = true;
ITEM.cost = 6;
ITEM.access = "1";
ITEM.model = "models/gibs/props_canteen/vm_sneckol.mdl";
ITEM.weight = 0.6;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A lumpy bag with a powdery substance. Smells awful, and probably won't taste much better.";
ITEM.hunger = 10;
ITEM.thirst = -5;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth(math.Clamp(player:Health() -5, 0, player:GetMaxHealth()));
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();