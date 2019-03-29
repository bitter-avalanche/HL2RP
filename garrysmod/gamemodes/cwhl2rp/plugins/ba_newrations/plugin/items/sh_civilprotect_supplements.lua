--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Civil Protection Tier Supplement Powder";
ITEM.uniqueID = "cp_supplements";
ITEM.model = "models/probs_misc/tobccco_box-1.mdl";
ITEM.weight = 0.6;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A stylish black box, filled with powder.";
ITEM.hunger = 20;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth(math.Clamp(player:Health() + 15, 0, player:GetMaxHealth()));
end;

function ITEM:OnUse(player, itemEntity)

	player:BoostAttribute(self.name, ATB_STRENGTH, 5, 3600);
	player:BoostAttribute(self.name, ATB_ENDURANCE, 5, 3600);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();