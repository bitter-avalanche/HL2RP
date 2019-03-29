--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Loyalist Tier Supplement Powder";
ITEM.uniqueID = "loyalist_supplements";
ITEM.model = "models/foodnhouseholdaaaaa/combirationc.mdl";
ITEM.weight = 0.6;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A lumpy bag with a powdery substance. Smells awful, and probably won't taste much better.";
ITEM.hunger = 15;
ITEM.business = true;
ITEM.cost = 24;
ITEM.access = "1";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth(math.Clamp(player:Health() + 10, 0, player:GetMaxHealth()));
end;

function ITEM:OnUse(player, itemEntity)

	player:BoostAttribute(self.name, ATB_STRENGTH, 3, 3600);
	player:BoostAttribute(self.name, ATB_ENDURANCE, 3, 3600);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();