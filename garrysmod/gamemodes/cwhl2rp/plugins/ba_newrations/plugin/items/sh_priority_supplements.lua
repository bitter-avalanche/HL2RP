--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();

ITEM.name = "Priority Tier Supplement Powder";
ITEM.uniqueID = "priority_supplements";
ITEM.model = "models/probs_misc/tobdcco_box-1.mdl";
ITEM.weight = 0.6;
ITEM.useText = "Eat";
ITEM.category = "Consumables";
ITEM.description = "A lumpy bag with a powdery substance. Smells awful, and probably won't taste much better. At least it's put into a nice box.";
ITEM.hunger = 15;

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	player:SetHealth(math.Clamp(player:Health() + 10, 0, player:GetMaxHealth()));
end;

function ITEM:OnUse(player, itemEntity)

	player:BoostAttribute(self.name, ATB_STRENGTH, 4, 3600);
	player:BoostAttribute(self.name, ATB_ENDURANCE, 4, 3600);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();